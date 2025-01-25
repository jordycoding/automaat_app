import 'dart:io';
import 'package:automaat_app/config/constants.dart';
import 'package:automaat_app/data/services/api/model/car_list/car_list.dart';
import 'package:automaat_app/data/services/api/model/customer_resource/customer_resource.dart';
import 'package:automaat_app/utils/http_delegate.dart';
import 'package:automaat_app/utils/result.dart';

typedef AuthHeaderProvider = String? Function();

class ApiClient with HttpDelegate {
  ApiClient({
    HttpClient Function()? clientFactory,
  }) : _clientFactory = clientFactory ?? HttpClient.new;

  final HttpClient Function() _clientFactory;
  AuthHeaderProvider? _authHeaderProvider;

  set authHeaderProvider(AuthHeaderProvider? value) {
    _authHeaderProvider = value;
  }

  Future<void> _authHeader(HttpHeaders headers) async {
    final header = _authHeaderProvider?.call();
    if (header != null) {
      headers.add(HttpHeaders.authorizationHeader, header);
    }
  }

  // Auto endpoints
  Future<Result<List<Car>>> getCars() async {
    return getRequest<List<Car>>(
      Uri.parse("${AppConstants.serverUrl}/cars"),
      _clientFactory,
      (dynamic json) => (json as List).map((e) {
        return Car.fromJson(e as Map<String, dynamic>);
      }).toList(),
      _authHeader,
    );
  }

  // Customer endpoints
  Future<Result<CustomerResource>> customerMe() async {
    return getRequest(
      Uri.parse("${AppConstants.serverUrl}/AM/me"),
      _clientFactory,
      CustomerResource.fromJson,
      _authHeader,
    );
  }

  // Auth check
  Future<Result<String>> checkAuth() {
    return getRequest<String>(
      Uri.parse("${AppConstants.serverUrl}/authenticate"),
      _clientFactory,
      null,
      _authHeader,
      true,
    );
  }
}