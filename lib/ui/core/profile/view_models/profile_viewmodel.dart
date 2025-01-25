import 'package:automaat_app/data/repositories/profile/profile_repository.dart';
import 'package:automaat_app/data/services/api/model/customer_resource/customer_resource.dart';
import 'package:automaat_app/utils/command.dart';
import 'package:automaat_app/utils/result.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel({required ProfileRepository profileRepository})
      : _profileRepository = profileRepository {
    getProfile = Command0<CustomerResource>(_getProfile);
  }

  final ProfileRepository _profileRepository;
  final _log = Logger("ProfileViewModel");
  CustomerResource? _profile;

  CustomerResource? get profile => _profile;

  late Command0 getProfile;

  Future<Result<CustomerResource>> _getProfile() async {
    final result = await _profileRepository.getProfile();
    switch (result) {
      case Ok<CustomerResource>():
        _log.fine("Fetched profile");
        _profile = result.value;
        notifyListeners();
      case Error<CustomerResource>():
        _log.warning("Failed to fetch profile");
    }

    return result;
  }
}
