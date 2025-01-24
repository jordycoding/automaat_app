// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarImpl _$$CarImplFromJson(Map<String, dynamic> json) => _$CarImpl(
      id: (json['id'] as num).toInt(),
      brand: json['brand'] as String,
      model: json['model'] as String,
      picture: json['picture'] as String,
      fuel: json['fuel'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$CarImplToJson(_$CarImpl instance) => <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'model': instance.model,
      'picture': instance.picture,
      'fuel': instance.fuel,
      'price': instance.price,
    };
