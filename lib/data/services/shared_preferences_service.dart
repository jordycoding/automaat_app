import 'package:automaat_app/utils/result.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const _tokenKey = "TOKEN";
  final _log = Logger("SharedPreferencesService");

  Future<Result<String?>> fetchToken() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      _log.finer("Got token from SharedPreferences");
      return Result.ok(sharedPreferences.getString(_tokenKey));
    } on Exception catch (e) {
      _log.warning("Failed to get token", e);
      return Result.error(e);
    }
  }

  Future<Result<void>> saveToken(String? token) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      if (token == null) {
        _log.finer("Removed token");
        await sharedPreferences.remove(_tokenKey);
      } else {
        _log.finer("Replaced token");
        await sharedPreferences.setString(_tokenKey, token);
      }
      return const Result.ok(null);
    } on Exception catch (e) {
      _log.warning("Failed to set token", e);
      return Result.error(e);
    }
  }

  Future<Result<void>> saveData(String key, String data) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString(key, data);
      return const Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<String>> fetchData(String key) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final result = sharedPreferences.getString(key);
      if (result != null) {
        return Result.ok(result);
      }
      return Result.error(Exception("No cache available"));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
