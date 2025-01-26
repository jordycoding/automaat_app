import 'package:automaat_app/data/services/api/api_client.dart';
import 'package:automaat_app/data/services/api/model/id_holder/id_holder.dart';
import 'package:automaat_app/data/services/api/model/post_inspection_response/post_inspection_response.dart';
import 'package:automaat_app/data/services/api/model/rental/rental.dart';
import 'package:automaat_app/utils/result.dart';
import 'package:logging/logging.dart';

class RentalRepository {
  RentalRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;
  final _log = Logger("RentalRepository");

  Future<Result<List<Rental>>> getRentals(int customerId) async {
    return await _apiClient.getRentals(customerId);
  }

  Future<Result<void>> deleteRental(int rentalId) async {
    return await _apiClient.deleteRental(rentalId);
  }

  Future<Result<PostInspectionResponse>> createInspection({
    required String code,
    required int odometer,
    required String result,
    required String description,
    required String photo,
    required String photoContentType,
    required String completed,
    required IdHolder car,
  }) async {
    return await _apiClient.createInspection(
      code: code,
      odometer: odometer,
      result: result,
      description: description,
      photo: photo,
      photoContentType: photoContentType,
      completed: completed,
      car: car,
    );
  }
}
