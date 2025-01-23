import 'dart:convert';
import 'dart:io';

import 'package:automaat_app/config/constants.dart';
import 'package:automaat_app/data/services/api/model/login_request/login_request.dart';
import 'package:automaat_app/data/services/api/model/login_response/login_response.dart';
import 'package:automaat_app/data/services/api/model/register_request/register_request.dart';
import 'package:automaat_app/utils/result.dart';

class AuthApiClient {
  AuthApiClient({HttpClient Function()? clientFactory})
      : _clientFactory = clientFactory ?? HttpClient.new;

  final HttpClient Function() _clientFactory;

  Future<Result<void>> register(RegisterRequest registerRequest) async {
    final client = _clientFactory();
    try {
      final request = await client
          .postUrl(Uri.parse("${AppConstants.serverUrl}/AM/register"));
      request.headers.contentType = ContentType.json;
      request.write(jsonEncode(registerRequest));
      final response = await request.close();
      if (response.statusCode == 201) {
        return Result.ok(null);
      } else {
        return Result.error(Exception("Failed to register"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<void>> login(LoginRequest loginRequest) async {
    final client = _clientFactory();
    try {
      final request = await client
          .postUrl(Uri.parse("${AppConstants.serverUrl}/authenticate"));
      request.write(jsonEncode(loginRequest));
      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        return Result.ok(LoginResponse.fromJson(jsonDecode(stringData)));
      } else {
        return const Result.error(HttpException("Login error"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }
}
