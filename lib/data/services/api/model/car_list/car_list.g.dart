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
      pictureContentType: json['pictureContentType'] as String,
      fuel: json['fuel'] as String,
      options: json['options'] as String,
      licensePlate: json['licensePlate'] as String,
      engineSize: (json['engineSize'] as num).toInt(),
      modelYear: (json['modelYear'] as num).toInt(),
      since: DateTime.parse(json['since'] as String),
      price: (json['price'] as num).toDouble(),
      nrOfSeats: (json['nrOfSeats'] as num).toInt(),
      body: json['body'] as String,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$CarImplToJson(_$CarImpl instance) => <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'model': instance.model,
      'picture': instance.picture,
      'pictureContentType': instance.pictureContentType,
      'fuel': instance.fuel,
      'options': instance.options,
      'licensePlate': instance.licensePlate,
      'engineSize': instance.engineSize,
      'modelYear': instance.modelYear,
      'since': instance.since.toIso8601String(),
      'price': instance.price,
      'nrOfSeats': instance.nrOfSeats,
      'body': instance.body,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
