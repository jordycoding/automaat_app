import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:automaat_app/utils/result.dart';
import 'package:automaat_app/data/repositories/car_list/car_repository.dart';
import 'package:automaat_app/data/repositories/rental/rental_repository.dart';
import 'package:automaat_app/data/repositories/profile/profile_repository.dart';
import 'package:automaat_app/data/services/api/model/car_list/car_list.dart';
import 'package:automaat_app/data/services/api/model/rental/rental.dart';
import 'package:automaat_app/data/services/api/model/customer_resource/customer_resource.dart';
import 'package:location/location.dart'; // Gebruik de location package

class CarDetailViewModel extends ChangeNotifier {
  final CarRepository carRepository;
  final RentalRepository rentalRepository;
  final ProfileRepository profileRepository;
  final int carId;
  final Logger _logger = Logger('CarDetailViewModel');

  Car? _car;
  Object? _error;
  bool _isLoading = false;
  bool _isReserving = false;
  DateTime? _fromDate;
  DateTime? _toDate;
  Object? _reservationError;
  int? _customerId;

  CarDetailViewModel({
    required this.carRepository,
    required this.rentalRepository,
    required this.profileRepository,
    required this.carId,
  }) {
    _initialize();
  }

  Car? get car => _car;
  Object? get error => _error;
  bool get isLoading => _isLoading;
  bool get isReserving => _isReserving;
  DateTime? get fromDate => _fromDate;
  DateTime? get toDate => _toDate;
  Object? get reservationError => _reservationError;

  Future<void> _initialize() async {
    await _loadCustomerId();
    await loadCar();
  }

  Future<void> _loadCustomerId() async {
    try {
      final result = await profileRepository.getProfile();
      _logger.info('ProfileRepository.getProfile() result: $result');

      if (result is Ok<CustomerResource>) {
        _customerId = result.value.id;
        _logger.fine('Customer ID set to $_customerId');
      } else if (result is Error<CustomerResource>) {
        _error = result.error;
        _logger.warning('Error getting customer profile: ${result.error}');
      }
    } catch (e, stackTrace) {
      _error = e;
      _logger.severe('Failed to load customer ID', e, stackTrace);
    }
    notifyListeners();
  }

  Future<void> loadCar() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await carRepository.fetchCarDetails(carId);
      _logger.info('Result of fetchCarDetails($carId): $result');

      if (result is Ok<Car>) {
        _car = result.value;
        _logger.fine('Loaded car details: ${_car?.id}, model: ${_car?.model}');
      } else if (result is Error<Car>) {
        _error = result.error;
        _car = null;
        _logger.warning('Car details error: ${result.error}');
      }
    } catch (e, stackTrace) {
      _error = e;
      _car = null;
      _logger.severe('Critical car details error', e, stackTrace);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setDates(DateTime from, DateTime to) {
    _fromDate = from;
    _toDate = to;
    _logger.info('Dates set: from $_fromDate to $_toDate');
    notifyListeners();
  }

  Future<void> reserveCar() async {
    if (_fromDate == null || _toDate == null) {
      _logger.warning('Cannot reserve: fromDate or toDate is null');
      _reservationError = 'Selecteer eerst de datums';
      notifyListeners();
      return;
    }
    if (_customerId == null) {
      _logger.warning('Cannot reserve: customerId is null');
      _reservationError = 'Customer not authenticated';
      notifyListeners();
      return;
    }

    _isReserving = true;
    _reservationError = null;
    notifyListeners();

    try {
      // Haal de huidige locatie op met het location package
      final Location location = Location();
      final LocationData locationData = await location.getLocation();
      final double currentLatitude = locationData.latitude ?? 0.0;
      final double currentLongitude = locationData.longitude ?? 0.0;
      _logger.info('Current location: lat=$currentLatitude, long=$currentLongitude');

      // Roep de createRental methode in de repository aan en geef de locatie mee.
      final result = await rentalRepository.createRental(
        carId: carId,
        customerId: _customerId!,
        startDate: _fromDate!,
        endDate: _toDate!,
        currentLatitude: currentLatitude,
        currentLongitude: currentLongitude,
      );

      _logger.info('Result of createRental: $result');

      if (result is Ok<Rental>) {
        _logger.info('Reservation created successfully: ${result.value.id}');
      } else if (result is Error<Rental>) {
        _reservationError = result.error;
        _logger.warning('Reservation error: ${result.error}');
      }
    } catch (e, stackTrace) {
      _reservationError = 'Reservation failed';
      _logger.severe('Error during reservation', e, stackTrace);
    } finally {
      _isReserving = false;
      notifyListeners();
    }
  }

  void clearReservationError() {
    _reservationError = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _logger.info('CarDetailViewModel with carId=$carId is being disposed');
    super.dispose();
  }
}
