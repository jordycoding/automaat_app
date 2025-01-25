import 'package:automaat_app/data/repositories/profile/profile_repository.dart';
import 'package:automaat_app/data/services/api/api_client.dart';
import 'package:automaat_app/data/services/api/model/customer_resource/customer_resource.dart';
import 'package:automaat_app/utils/result.dart';
import 'package:logging/logging.dart';

class ProfileRepositoryRemote extends ProfileRepository {
  ProfileRepositoryRemote({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;
  final _log = Logger("ProfileRepositoryRemote");

  @override
  Future<Result<CustomerResource>> getProfile() async {
    try {
      final result = await _apiClient.customerMe();
      switch (result) {
        case Ok<CustomerResource>():
          _log.info("Fetched profile");
          return result;
        case Error<CustomerResource>():
          _log.warning("Error fetching profile: ${result.error}");
          return result;
      }
    } finally {
      notifyListeners();
    }
  }
}
