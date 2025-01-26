import 'package:automaat_app/data/services/api/api_client.dart';
import 'package:automaat_app/data/services/api/model/car_list/car_list.dart';
import 'package:automaat_app/utils/result.dart';

abstract class CarRepository {
  Future<Result<List<Car>>> getCars({bool forceRefresh = false});
  Future<Result<Car>> getCar(int id);
}

class ApiCarRepository implements CarRepository {
  final ApiClient _apiClient;
  List<Car>? _cachedCars;

  ApiCarRepository(this._apiClient);

  @override
  Future<Result<List<Car>>> getCars({bool forceRefresh = false}) async {
    if (_cachedCars != null && !forceRefresh) return Result.ok(_cachedCars!);
    
    final result = await _apiClient.getCars();
    if (result is Ok<List<Car>>) {
      _cachedCars = result.value;
    }
    return result;
  }

  @override
  Future<Result<Car>> getCar(int id) async {
    try {
      return await _apiClient.getCar(id);
    } catch (e) {
      return Result.error(e is Exception ? e : Exception(e.toString()));
    }
  }
}