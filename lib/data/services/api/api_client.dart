import 'dart:io';

typedef AuthHeaderProvider = String? Function();

class ApiClient {
  ApiClient({
    HttpClient Function()? clientFactory,
  }) : _clientFactory = clientFactory ?? HttpClient.new;

  final HttpClient Function() _clientFactory;

  AuthHeaderProvider? _authHeaderProvider;

  set AuthHeaderProvider(AuthHeaderProvider? value) {
    _authHeaderProvider = value;
  }

  Future<void> _authHeader(HttpHeaders headers) {
    final header = _authHeaderProvider?.call();
    if (header != null) {
      headers.add(HttpHeaders.authorizationHeader, header);
    }
  }
}
