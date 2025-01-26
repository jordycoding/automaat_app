import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:automaat_app/data/repositories/car_list/car_repository.dart';
import 'package:automaat_app/utils/result.dart';
import 'package:automaat_app/data/services/api/model/car_list/car_list.dart';

class CarDetailViewModel extends ChangeNotifier {
  final CarRepository _repository;
  final int carId;
  final Logger _logger = Logger('CarDetailViewModel');
  
  Car? _car;
  bool _isLoading = false;
  Exception? _error;

  CarDetailViewModel({
    required CarRepository repository,
    required this.carId,
  }) : _repository = repository {
    _loadCar();
  }

  Car? get car => _car;
  bool get isLoading => _isLoading;
  Exception? get error => _error;

  Future<void> _loadCar() async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await _repository.getCar(carId);
      switch (result) {
        case Ok<Car>(:final value):
          _car = value;
          _logger.fine('Car details loaded: ${value.id}');
        case Error<Car>(:final error):
          _error = error;
          _logger.warning('Error loading car: $error');
      }
    } catch (e, stackTrace) {
      _error = e is Exception ? e : Exception(e.toString());
      _logger.severe('Critical error', _error, stackTrace);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    _car = null;
    _error = null;
    await _loadCar();
  }
}