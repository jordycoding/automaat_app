import 'package:freezed_annotation/freezed_annotation.dart';

part "location.freezed.dart";

part "location.g.dart";

@freezed
class Location with _$Location {
  const factory Location({
    required int id,
    String? streetAddress,
    String? postalCode,
    String? city,
    String? stateProvince,
  }) = _Location;

  factory Location.fromJson(Map<String, Object?> json) =>
      _$LocationFromJson(json);
}
