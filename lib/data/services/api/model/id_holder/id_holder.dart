import 'package:freezed_annotation/freezed_annotation.dart';

part "id_holder.freezed.dart";
part "id_holder.g.dart";

@freezed
class IdHolder with _$IdHolder {
  const factory IdHolder({required int id}) = _IdHolder;

  factory IdHolder.fromJson(Map<String, Object?> json) =>
      _$IdHolderFromJson(json);
}
