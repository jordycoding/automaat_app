// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_list_holder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RentalListHolderImpl _$$RentalListHolderImplFromJson(
        Map<String, dynamic> json) =>
    _$RentalListHolderImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Rental.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RentalListHolderImplToJson(
        _$RentalListHolderImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
