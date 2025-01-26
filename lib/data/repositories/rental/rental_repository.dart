import 'package:automaat_app/data/services/api/api_client.dart';
import 'package:automaat_app/data/services/api/model/rental/rental.dart';
import 'package:automaat_app/utils/result.dart';
import 'package:logging/logging.dart';

class RentalRepository {
  RentalRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;
  final _log = Logger("RentalRepository");

  @override
  Future<Result<List<Rental>>> getRentals(int customerId) async {
    return await _apiClient.getRentals(customerId);
  }
}
