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
      pictureContentType: json['pictureContentType'] as String,
      options: json['options'] as String,
      licensePlate: json['licensePlate'] as String,
      engineSize: (json['engineSize'] as num).toInt(),
      modelYear: (json['modelYear'] as num).toInt(),
      since: DateTime.parse(json['since'] as String),
      nrOfSeats: (json['nrOfSeats'] as num).toInt(),
      body: json['body'] as String,
      latitude: (json['latitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$CarImplToJson(_$CarImpl instance) => <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'model': instance.model,
      'picture': instance.picture,
      'fuel': instance.fuel,
      'price': instance.price,
      'pictureContentType': instance.pictureContentType,
      'options': instance.options,
      'licensePlate': instance.licensePlate,
      'engineSize': instance.engineSize,
      'modelYear': instance.modelYear,
      'since': instance.since.toIso8601String(),
      'nrOfSeats': instance.nrOfSeats,
      'body': instance.body,
      'latitude': instance.latitude,
    };
