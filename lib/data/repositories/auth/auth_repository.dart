import 'package:automaat_app/utils/result.dart';
import 'package:flutter/foundation.dart';

abstract class AuthRepository extends ChangeNotifier {
  Future<bool> get isAuthenticated;

  Future<Result<void>> login(
      {required String username, required String password});

  Future<Result<void>> logout();

  Future<Result<void>> register({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });

  Future<Result<void>> resetPassword({required String email});
}
