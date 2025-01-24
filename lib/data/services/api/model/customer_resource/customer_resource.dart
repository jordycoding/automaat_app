import 'package:automaat_app/data/services/api/model/managed_user_vm/managed_user_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "customer_resource.freezed.dart";

part "customer_resource.g.dart";

@freezed
class CustomerResource with _$CustomerResource {
  const factory CustomerResource({
    required int id,
    int? nr,
    required String firstName,
    required String lastName,
    required String from,
    ManagedUserVm? systemUser,
  }) = _CustomerResource;

  factory CustomerResource.fromJson(Map<String, Object?> json) =>
      _$CustomerResourceFromJson(json);
}
