import "package:freezed_annotation/freezed_annotation.dart";
import "package:flutter/foundation.dart";

part "login_response.freezed.dart";

part "login_response.g.dart";

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required String idToken,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, Object?> json) =>
      _$LoginResponseFromJson(json);
}
