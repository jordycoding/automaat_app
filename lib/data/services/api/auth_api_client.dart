import 'dart:io';

import 'package:automaat_app/config/constants.dart';
import 'package:automaat_app/data/services/api/model/register_request/register_request.dart';
import 'package:automaat_app/utils/result.dart';

class AuthApiClient {
  AuthApiClient({HttpClient Function()? clientFactory})
      : _clientFactory = clientFactory ?? HttpClient.new;

  final HttpClient Function() _clientFactory;

    Future<Result<void>> register (RegisterRequest registerRequest) async {
        final client = _clientFactory();
        try {
            final request = await client.postUrl(Uri.parse("${AppConstants.serverUrl}/AM/register"));
            request.write(registerRequest.toJson());
            final response = await request.close();
            if (response.statusCode == 201) {
                return const Result.ok(());
            } else {
            return Result.error(Exception("Failed to register"));
            }
        } on Exception catch (error) {
            return Result.error(error);
        } finally {
            client.close();
        }
    }
}
