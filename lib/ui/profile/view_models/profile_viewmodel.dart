import 'package:automaat_app/data/repositories/auth/auth_repository.dart';
import 'package:automaat_app/data/repositories/profile/profile_repository.dart';
import 'package:automaat_app/data/services/api/model/customer_resource/customer_resource.dart';
import 'package:automaat_app/utils/command.dart';
import 'package:automaat_app/utils/result.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel(
      {required ProfileRepository profileRepository,
      required AuthRepository authRepository})
      : _authRepository = authRepository,
        _profileRepository = profileRepository {
    getProfile = Command0<CustomerResource>(_getProfile);
    logout = Command0<void>(_logout);
  }

  final ProfileRepository _profileRepository;
  final AuthRepository _authRepository;
  final _log = Logger("ProfileViewModel");
  CustomerResource? _profile;

  CustomerResource? get profile => _profile;

  late Command0 getProfile;
  late Command0 logout;

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

  Future<Result<void>> _logout() async {
    final result = await _authRepository.logout();
    return result;
  }
}
