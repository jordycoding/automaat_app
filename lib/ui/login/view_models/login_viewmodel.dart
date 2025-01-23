import 'package:automaat_app/data/repositories/auth/auth_repository.dart';
import 'package:automaat_app/utils/command.dart';
import "package:automaat_app/utils/result.dart";
import 'package:logging/logging.dart';

class LoginViewmodel {
  LoginViewmodel({required AuthRepository authRepository})
      : _authRepository = authRepository {
    login = Command1<void, (String username, String password)>(_login);
  }

  final AuthRepository _authRepository;
  final _log = Logger("LoginViewmodel");

  late Command1 login;

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
}
