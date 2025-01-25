import 'package:automaat_app/data/services/api/model/car_list/car_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "car_list_holder.freezed.dart";
part "car_list_holder.g.dart";

@freezed
class CarListHolder with _$CarListHolder {
  const factory CarListHolder(List<Car> data) = _CarListHolder;

  factory CarListHolder.fromJson(Map<String, dynamic> json) =>
      _$CarListHolderFromJson(json);
}
