import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:automaat_app/utils/result.dart';
import 'package:automaat_app/data/repositories/car_list/car_repository.dart';
import 'package:automaat_app/data/services/api/model/car_list/car_list.dart';

class CarListViewModel extends ChangeNotifier {
  CarListViewModel({required this.repository});

  final CarRepository repository;
  final Logger _logger = Logger('CarListViewModel');

  List<Car> _cars = const [];
  Object? _error;
  bool _isLoading = false;

  List<Car> get cars => _cars; 
  Object? get error => _error;
  bool get isLoading => _isLoading;

  Future<void> loadCars({bool forceRefresh = false}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await repository.getCars(forceRefresh: forceRefresh);
      
      switch (result) {
        case Ok<List<Car>>(:final value):
          _cars = value; 
          _logger.fine('Loaded ${value.length} cars');
        
        case Error<List<Car>>(:final error):
          _error = error;
          _cars = const [];
          _logger.warning('Load error: $error');
      }
    } catch (e, stackTrace) {
      _error = e;
      _cars = const [];
      _logger.severe('Critical error', e, stackTrace);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}