import 'package:automaat_app/data/services/api/api_client.dart';
import 'package:automaat_app/data/services/api/model/car_list/car_list.dart';
import 'package:automaat_app/utils/result.dart';

class CarRepository {
  final ApiClient _apiClient;
  List<Car>? _cachedCars;

  CarRepository(this._apiClient);

  Future<Result<List<Car>>> getCars({bool forceRefresh = false}) async {
    if (_cachedCars != null && !forceRefresh) return Result.ok(_cachedCars!);

    final result = await _apiClient.getCars();
    if (result is Ok<List<Car>>) {
      _cachedCars = result.value;
    }

    return result;
  }

    Future<Result<Car>> fetchCarDetails(int carId) async {
    try {
      final result = await _apiClient.getCarDetails(carId);
      return result;
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}