import 'dart:convert';
import 'dart:io';

import 'package:automaat_app/config/constants.dart';
import 'package:automaat_app/data/services/api/model/login_request/login_request.dart';
import 'package:automaat_app/data/services/api/model/login_response/login_response.dart';
import 'package:automaat_app/data/services/api/model/register_request/register_request.dart';
import 'package:automaat_app/utils/http_delegate.dart';
import 'package:automaat_app/utils/result.dart';
import 'package:logging/logging.dart';

class AuthApiClient with HttpDelegate {
  AuthApiClient({HttpClient Function()? clientFactory})
      : _clientFactory = clientFactory ?? HttpClient.new;

  final HttpClient Function() _clientFactory;
  final _log = Logger("AuthApiClient");

  Future<Result<void>> register(RegisterRequest registerRequest) async {
    return postRequest(Uri.parse("${AppConstants.serverUrl}/AM/register"),
        _clientFactory, registerRequest, null, _log);
  }

  Future<Result<LoginResponse>> login(LoginRequest loginRequest) async {
    return postRequest(Uri.parse("${AppConstants.serverUrl}/authenticate"),
        _clientFactory, loginRequest, LoginResponse.fromJson);
  }

  Future<Result<void>> resetPassword(String email) async {
    return postRequest(
      Uri.parse("${AppConstants.serverUrl}/account/reset-password/init"),
      _clientFactory,
      email,
      null,
      null,
      RequestType.plain,
    );
  }
}
