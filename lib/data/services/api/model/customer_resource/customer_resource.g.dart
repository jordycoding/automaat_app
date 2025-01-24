// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerResourceImpl _$$CustomerResourceImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerResourceImpl(
      id: (json['id'] as num).toInt(),
      nr: (json['nr'] as num?)?.toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      from: json['from'] as String,
      systemUser: json['systemUser'] == null
          ? null
          : ManagedUserVm.fromJson(json['systemUser'] as Map<String, dynamic>),
      rentals: (json['rentals'] as List<dynamic>?)
          ?.map((e) => Rental.fromJson(e as Map<String, dynamic>))
          .toList(),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CustomerResourceImplToJson(
        _$CustomerResourceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nr': instance.nr,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'from': instance.from,
      'systemUser': instance.systemUser,
      'rentals': instance.rentals,
      'location': instance.location,
    };
