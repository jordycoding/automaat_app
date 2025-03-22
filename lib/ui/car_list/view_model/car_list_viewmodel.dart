import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:automaat_app/utils/result.dart';
import 'package:automaat_app/data/repositories/car_list/car_repository.dart';
import 'package:automaat_app/data/services/api/model/car_list/car_list.dart';

class CarListViewModel extends ChangeNotifier {
  CarListViewModel({required this.repository});

  final CarRepository repository;
  final Logger _logger = Logger('CarListViewModel');

  List<Car> _cars = [];
  List<Car> _filteredCars = [];
  Object? _error;
  bool _isLoading = false;
  Car? _selectedCar;
  String? _selectedMake;
  String? _selectedBody;

  List<Car> get cars => _filteredCars;
  Object? get error => _error;
  bool get isLoading => _isLoading;
  Car? get selectedCar => _selectedCar;

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
          _filteredCars = _cars;
        
        case Error<List<Car>>(:final error):
          _error = error;
          _cars = [];
          _filteredCars = [];
          _logger.warning('Load error: $error');
      }
    } catch (e, stackTrace) {
      _error = e;
      _cars = [];
      _filteredCars = [];
      _logger.severe('Critical error', e, stackTrace);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectCar(Car car) {
    _selectedCar = car;
    notifyListeners();
  }

  void filterCars({String? make, String? body}) {
    _selectedMake = make;
    _selectedBody = body;
    _filteredCars = _cars.where((car) {
      final matchesMake = (make == null || make.isEmpty) ||
          car.brand.toLowerCase() == make.toLowerCase();
      final matchesBody = (body == null || body.isEmpty) ||
          car.body.toLowerCase() == body.toLowerCase();
      return matchesMake && matchesBody;
    }).toList();
    notifyListeners();
  }

  List<String> get availableMakes {
    final makes = _cars.map((car) => car.brand).toSet().toList();
    makes.sort();
    return makes;
  }

  List<String> get availableBodies {
    final bodies = _cars.map((car) => car.body).toSet().toList();
    bodies.sort();
    return bodies;
  }
}
