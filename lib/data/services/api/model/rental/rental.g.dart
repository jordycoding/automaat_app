// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RentalImpl _$$RentalImplFromJson(Map<String, dynamic> json) => _$RentalImpl(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      fromDate: json['fromDate'] as String,
      toDate: json['toDate'] as String,
      state: $enumDecodeNullable(_$RentalStateEnumMap, json['state']),
      inspections: (json['inspections'] as List<dynamic>?)
          ?.map((e) => Inspection.fromJson(e as Map<String, dynamic>))
          .toList(),
      customer: json['customer'] == null
          ? null
          : CustomerResource.fromJson(json['customer'] as Map<String, dynamic>),
      car: Car.fromJson(json['car'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RentalImplToJson(_$RentalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'state': _$RentalStateEnumMap[instance.state],
      'inspections': instance.inspections,
      'customer': instance.customer,
      'car': instance.car,
    };

const _$RentalStateEnumMap = {
  RentalState.active: 'ACTIVE',
  RentalState.reserved: 'RESERVED',
  RentalState.pickup: 'PICKUP',
  RentalState.returned: 'RETURNED',
};
