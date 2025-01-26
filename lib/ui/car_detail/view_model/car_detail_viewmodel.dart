import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:automaat_app/data/repositories/car_list/car_repository.dart';
import 'package:automaat_app/utils/result.dart';
import 'package:automaat_app/data/services/api/model/car_list/car_list.dart';

class CarDetailViewModel extends ChangeNotifier {
  final CarRepository _repository;
  final int carId; // Correct gedefinieerde parameter
  final Logger _logger = Logger('CarDetailViewModel');
  
  Car? _car;
  bool _isLoading = false;
  Object? _error;
  bool _isReserving = false;
  Exception? _reservationError;

  CarDetailViewModel({
    required CarRepository repository,
    required this.carId, // Juiste declaratie
  }) : _repository = repository {
    _loadCar();
  }

  Car? get car => _car;
  bool get isLoading => _isLoading;
  Object? get error => _error;
  bool get isReserving => _isReserving; // Enkele definitie
  Exception? get reservationError => _reservationError;

  Future<void> _loadCar() async {
    _isLoading = true;
    notifyListeners();


  }

  Future<void> reserveCar() async {
    _isReserving = true;
    notifyListeners();
    
    try {
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      _reservationError = e as Exception;
      _logger.severe('Reservation error: $e');
    } finally {
      _isReserving = false;
      notifyListeners();
    }
  }
}