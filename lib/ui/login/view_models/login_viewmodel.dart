import 'package:automaat_app/data/repositories/auth/auth_repository.dart';
import 'package:automaat_app/utils/command.dart';
import "package:automaat_app/utils/result.dart";
import 'package:logging/logging.dart';

class LoginViewmodel {
  LoginViewmodel({required AuthRepository authRepository})
      : _authRepository = authRepository {
    login = Command1<void, (String username, String password)>(_login);
    resetPassword = Command1<void, String>(_resetPassword);
  }

  final AuthRepository _authRepository;
  final _log = Logger("LoginViewmodel");

  late Command1 login;
  late Command1 resetPassword;

  Future<Result<void>> _login((String, String) credentials) async {
    final (username, password) = credentials;
    final result = await _authRepository.login(
      username: username,
      password: password,
    );
    if (result is Error<void>) {
      _log.warning("Login failed");
    }
    return result;
  }

  Future<Result<void>> _resetPassword(String email) async {
    final result = await _authRepository.resetPassword(email: email);
    if (result is Error<void>) {
      _log.warning("Reset password failed");
    }
    return result;
  }
}
