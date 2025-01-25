import 'package:automaat_app/data/services/api/api_client.dart';
import 'package:automaat_app/data/services/api/model/car_list/car_list.dart';
import 'package:automaat_app/utils/result.dart';

class CarRepository {
  final ApiClient _apiClient;
  List<Car>? _cachedCars;

  CarRepository(this._apiClient);

  Future<Result<List<Car>>> getCars({bool forceRefresh = false}) async {
    // if (_cachedCars != null && !forceRefresh) return Result.ok(_cachedCars!);

    final result = await _apiClient.getCars();
    if (result is Ok<List<Car>>) {
      _cachedCars = result.value;
    }

    return result;
  }

  void invalidateCache() => _cachedCars = null;
}

