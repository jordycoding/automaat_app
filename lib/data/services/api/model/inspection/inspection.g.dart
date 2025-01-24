// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InspectionImpl _$$InspectionImplFromJson(Map<String, dynamic> json) =>
    _$InspectionImpl(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String?,
      odometer: (json['odometer'] as num?)?.toInt(),
      result: json['result'] as String?,
      description: json['description'] as String?,
      photo: json['photo'] as String?,
      photoContentType: json['photoContentType'] as String?,
      completed: json['completed'] as String?,
    );

Map<String, dynamic> _$$InspectionImplToJson(_$InspectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'odometer': instance.odometer,
      'result': instance.result,
      'description': instance.description,
      'photo': instance.photo,
      'photoContentType': instance.photoContentType,
      'completed': instance.completed,
    };
