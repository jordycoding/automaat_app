import 'package:automaat_app/data/services/api/model/id_holder/id_holder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "post_inspection_request.freezed.dart";
part "post_inspection_request.g.dart";

@freezed
class PostInspectionRequest with _$PostInspectionRequest {
  const factory PostInspectionRequest({
    required String code,
    required int odometer,
    required String result,
    required String description,
    required String photo,
    required String photoContentType,
    required String completed,
    required Object? photos,
    required Object? repairs,
    required IdHolder car,
    required Object? employee,
    required Object? rental,
  }) = _PostInspectionRequest;

  factory PostInspectionRequest.fromJson(Map<String, Object?> json) =>
      _$PostInspectionRequestFromJson(json);
}
