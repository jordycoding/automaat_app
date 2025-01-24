import 'package:freezed_annotation/freezed_annotation.dart';

part "managed_user_vm.freezed.dart";

part "managed_user_vm.g.dart";

@freezed
class ManagedUserVm with _$ManagedUserVm {
  const factory ManagedUserVm({
    required int id,
    String? login,
    required String firstName,
    required String lastName,
    required String email,
    String? imageUrl,
    required bool activated,
    required String langKey,
    String? createdBy,
    String? createdDate,
    String? lastModifiedBy,
    String? lastModifiedDate,
    List<String>? authorities,
    String? password,
  }) = _ManagedUserVm;

  factory ManagedUserVm.fromJson(Map<String, Object?> json) =>
      _$ManagedUserVmFromJson(json);
}
