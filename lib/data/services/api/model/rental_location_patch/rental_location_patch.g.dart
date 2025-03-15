// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_location_patch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RentalLocationPatchImpl _$$RentalLocationPatchImplFromJson(
        Map<String, dynamic> json) =>
    _$RentalLocationPatchImpl(
      id: (json['id'] as num).toInt(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$RentalLocationPatchImplToJson(
        _$RentalLocationPatchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
