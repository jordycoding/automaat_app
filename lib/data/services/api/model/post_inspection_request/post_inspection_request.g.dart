// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_inspection_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostInspectionRequestImpl _$$PostInspectionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PostInspectionRequestImpl(
      code: json['code'] as String,
      odometer: (json['odometer'] as num).toInt(),
      result: json['result'] as String,
      description: json['description'] as String,
      photo: json['photo'] as String,
      photoContentType: json['photoContentType'] as String,
      completed: json['completed'] as String,
      photos: json['photos'],
      repairs: json['repairs'],
      car: IdHolder.fromJson(json['car'] as Map<String, dynamic>),
      employee: json['employee'],
      rental: json['rental'],
    );

Map<String, dynamic> _$$PostInspectionRequestImplToJson(
        _$PostInspectionRequestImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'odometer': instance.odometer,
      'result': instance.result,
      'description': instance.description,
      'photo': instance.photo,
      'photoContentType': instance.photoContentType,
      'completed': instance.completed,
      'photos': instance.photos,
      'repairs': instance.repairs,
      'car': instance.car.toJson(),
      'employee': instance.employee,
      'rental': instance.rental,
    };
