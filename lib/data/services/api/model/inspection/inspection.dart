import "package:freezed_annotation/freezed_annotation.dart";

part "inspection.freezed.dart";

part "inspection.g.dart";

@freezed
class Inspection with _$Inspection {
  const factory Inspection({
    required int id,
    String? code,
    int? odometer,
    String? result,
    String? description,
    String? photo,
    String? photoContentType,
    String? completed,
  }) = _Inspection;

  factory Inpsection.fromJson(Map<String, Object?> json) =>
      _$InspectionFromJson(json);
}
