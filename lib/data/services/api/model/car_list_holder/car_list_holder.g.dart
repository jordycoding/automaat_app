// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_list_holder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarListHolderImpl _$$CarListHolderImplFromJson(Map<String, dynamic> json) =>
    _$CarListHolderImpl(
      (json['data'] as List<dynamic>)
          .map((e) => Car.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CarListHolderImplToJson(_$CarListHolderImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
