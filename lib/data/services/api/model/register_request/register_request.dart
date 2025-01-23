import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part "register_request.freezed.dart";

part "register_request.g.dart";

@freezed
class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required String login,
    required String firstName,
    required String lastName,
    required String email,
    required String langKey,
    required String password,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, Object?> json) =>
      _$RegisterRequestFromJson(json);
}
