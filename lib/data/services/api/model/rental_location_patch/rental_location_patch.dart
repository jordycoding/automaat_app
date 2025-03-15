import 'package:freezed_annotation/freezed_annotation.dart';

part "rental_location_patch.freezed.dart";
part "rental_location_patch.g.dart";

@freezed
class RentalLocationPatch with _$RentalLocationPatch {
  const factory RentalLocationPatch(
      {required int id,
      required double latitude,
      required double longitude}) = _RentalLocationPatch;

  factory RentalLocationPatch.fromJson(Map<String, Object?> json) =>
      _$RentalLocationPatchFromJson(json);
}
