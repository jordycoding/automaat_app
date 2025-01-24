import 'package:flutter/material.dart';
import 'package:automaat_app/data/repositories/car_list/car_repository.dart';
import 'package:automaat_app/data/services/api/model/car_list/car_list.dart';

class CarListViewModel extends ChangeNotifier {
  final CarRepository _repository;
  List<Car> _cars = [];
  bool _isLoading = false;
  Exception? _error;

  CarListViewModel(this._repository);

  List<Car> get cars => _cars;
  bool get isLoading => _isLoading;
  Exception? get error => _error;

  Future<void> loadCars({bool forceRefresh = false}) async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await _repository.getCars(forceRefresh: forceRefresh);
      _cars = result;
      _error = null;
    } on Exception catch (e) {
      _error = e;
      _cars = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}