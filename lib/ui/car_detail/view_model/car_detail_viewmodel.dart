import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:automaat_app/utils/result.dart';
import 'package:automaat_app/data/repositories/car_list/car_repository.dart';
import 'package:automaat_app/data/repositories/rental/rental_repository.dart';
import 'package:automaat_app/data/repositories/profile/profile_repository.dart';
import 'package:automaat_app/data/services/api/model/car_list/car_list.dart';
import 'package:automaat_app/data/services/api/model/rental/rental.dart';
import 'package:automaat_app/data/services/api/model/customer_resource/customer_resource.dart';

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
      if (result is Ok<CustomerResource>) {
        _customerId = result.value.id;
      } else if (result is Error<CustomerResource>) {
        _error = result.error;
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
      
      if (result is Ok<Car>) {
        _car = result.value;
        _logger.fine('Loaded car details: ${result.value.id}');
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
    notifyListeners();
  }

  Future<void> reserveCar() async {
    if (_fromDate == null || _toDate == null) return;
    if (_customerId == null) {
      _reservationError = 'Customer not authenticated';
      notifyListeners();
      return;
    }

    _isReserving = true;
    _reservationError = null;
    notifyListeners();

    try {
      final result = await rentalRepository.createRental(
        carId: carId,
        customerId: _customerId!,
        startDate: _fromDate!,
        endDate: _toDate!,
      );

      if (result is Ok<Rental>) {
        _logger.info('Reservation created: ${result.value.id}');
      } else if (result is Error<Rental>) {
        _reservationError = result.error;
        _logger.warning('Reservation error: ${result.error}');
      }
    } catch (e, stackTrace) {
      _reservationError = e;
      _logger.severe('Critical reservation error', e, stackTrace);
    } finally {
      _isReserving = false;
      notifyListeners();
    }
  }

  void clearReservationError() {
    _reservationError = null;
    notifyListeners();
  }
}