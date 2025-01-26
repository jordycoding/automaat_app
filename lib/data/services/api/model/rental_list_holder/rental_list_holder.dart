import 'package:automaat_app/data/services/api/model/rental/rental.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "rental_list_holder.freezed.dart";
part "rental_list_holder.g.dart";

@freezed
class RentalListHolder with _$RentalListHolder {
  const factory RentalListHolder({
    required List<Rental> data,
  }) = _RentalListHolder;

  factory RentalListHolder.fromJson(Map<String, dynamic> json) =>
      _$RentalListHolderFromJson(json);
}
