// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      id: (json['id'] as num).toInt(),
      streetAddress: json['streetAddress'] as String?,
      postalCode: json['postalCode'] as String?,
      city: json['city'] as String?,
      stateProvince: json['stateProvince'] as String?,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'streetAddress': instance.streetAddress,
      'postalCode': instance.postalCode,
      'city': instance.city,
      'stateProvince': instance.stateProvince,
    };
