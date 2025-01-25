import 'package:automaat_app/data/services/api/api_client.dart';
import 'package:automaat_app/data/services/api/model/car_list/car_list.dart';
import 'package:automaat_app/utils/result.dart';

class CarRepository {
  final ApiClient _apiClient;
  List<Car>? _cachedCars;

  CarRepository(this._apiClient);

  Future<List<Car>> getCars({bool forceRefresh = false}) async {
    if (_cachedCars != null && !forceRefresh) return _cachedCars!;
    
    final result = await _apiClient.getCars();
    
    return switch (result) {
      Ok(value: final cars) => _cachedCars = cars,
      Error(error: final e) => throw e,
    };
  }

  void invalidateCache() => _cachedCars = null;
}