import 'package:automaat_app/data/repositories/auth/auth_repository.dart';
import 'package:automaat_app/utils/command.dart';
import 'package:automaat_app/utils/result.dart';
import 'package:logging/logging.dart';

class RegisterViewModel {
  RegisterViewModel({required AuthRepository authRepository})
      : _authRepository = authRepository {
    register = Command1<
        void,
        (
          String username,
          String firstName,
          String lastName,
          String email,
          String password
        )>(_register);
  }

  final AuthRepository _authRepository;
  final _log = Logger("RegisterViewmodel");

  late Command1 register;

  Future<Result<void>> _register(
      (String, String, String, String, String) credentials) async {
    final (username, firstName, lastName, email, password) = credentials;
    final result = await _authRepository.register(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password);
    if (result is Error<void>) {
      _log.warning("Registering failed");
    }
    return result;
  }
}
