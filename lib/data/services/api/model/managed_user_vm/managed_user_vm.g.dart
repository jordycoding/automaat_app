// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'managed_user_vm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ManagedUserVmImpl _$$ManagedUserVmImplFromJson(Map<String, dynamic> json) =>
    _$ManagedUserVmImpl(
      id: (json['id'] as num).toInt(),
      login: json['login'] as String?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      imageUrl: json['imageUrl'] as String?,
      activated: json['activated'] as bool,
      langKey: json['langKey'] as String,
      createdBy: json['createdBy'] as String?,
      createdDate: json['createdDate'] as String?,
      lastModifiedBy: json['lastModifiedBy'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as String?,
      authorities: (json['authorities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$ManagedUserVmImplToJson(_$ManagedUserVmImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'imageUrl': instance.imageUrl,
      'activated': instance.activated,
      'langKey': instance.langKey,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
      'lastModifiedBy': instance.lastModifiedBy,
      'lastModifiedDate': instance.lastModifiedDate,
      'authorities': instance.authorities,
      'password': instance.password,
    };
