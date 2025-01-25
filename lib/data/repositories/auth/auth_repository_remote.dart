import 'package:automaat_app/data/repositories/auth/auth_repository.dart';
import 'package:automaat_app/data/services/api/api_client.dart';
import 'package:automaat_app/data/services/api/auth_api_client.dart';
import 'package:automaat_app/data/services/api/model/login_request/login_request.dart';
import 'package:automaat_app/data/services/api/model/login_response/login_response.dart';
import 'package:automaat_app/data/services/api/model/register_request/register_request.dart';
import 'package:automaat_app/data/services/shared_preferences_service.dart';
import 'package:automaat_app/utils/result.dart';
import 'package:logging/logging.dart';

class AuthRepositoryRemote extends AuthRepository {
  AuthRepositoryRemote({
    required ApiClient apiClient,
    required AuthApiClient authApiClient,
    required SharedPreferencesService sharedPreferencesService,
  })  : _apiClient = apiClient,
        _authApiClient = authApiClient,
        _sharedPreferencesService = sharedPreferencesService {
    _apiClient.authHeaderProvider = _authHeaderProvider;
  }

  final AuthApiClient _authApiClient;
  final ApiClient _apiClient;
  final SharedPreferencesService _sharedPreferencesService;

  bool? _isAuthenticated;
  String? _idToken;
  final _log = Logger("AuthRepositoryRemote");

  Future<void> _fetch() async {
    final result = await _sharedPreferencesService.fetchToken();
    switch (result) {
      case Ok<String?>():
        _idToken = result.value;
        _isAuthenticated = result.value != null;
      case Error<String?>():
        _log.severe(
            "Failed to fetch token from SharedPreferences", result.error);
    }
  }

  @override
  Future<bool> get isAuthenticated async {
    _log.info("Checking authentication");
    if (_isAuthenticated != null) {
      return _isAuthenticated!;
    }

    await _fetch();
    return _isAuthenticated ?? false;
  }

  @override
  Future<Result<void>> login({
    required String username,
    required String password,
  }) async {
    try {
      final result = await _authApiClient.login(
        LoginRequest(username: username, password: password, rememberMe: true),
      );
      switch (result) {
        case Ok<LoginResponse>():
          _log.info("Logged in");
          _log.info("Token ${result.value.idToken}");
          _isAuthenticated = true;
          _idToken = result.value.idToken;
          return await _sharedPreferencesService
              .saveToken(result.value.idToken);
        case Error<LoginResponse>():
          _log.warning("Error logging in: ${result.error}");
          return Result.error(result.error);
        default:
          _log.warning("This shouldnt happen");
          return Result.error(Exception("Fuck"));
      }
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> logout() async {
    _log.info("Logged out");
    try {
      final result = await _sharedPreferencesService.saveToken(null);
      if (result is Error<void>) {
        _log.severe("Failed to clear auth token");
      }
      _idToken = null;
      _isAuthenticated = false;
      return result;
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> register({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      return _authApiClient.register(
        RegisterRequest(
            login: username,
            firstName: firstName,
            lastName: lastName,
            email: email,
            langKey: "en",
            password: password),
      );
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> resetPassword({required String email}) async {
    try {
      return _authApiClient.resetPassword(email);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  String? _authHeaderProvider() => _idToken != null ? "Bearer $_idToken" : null;
}
