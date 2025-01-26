import 'package:automaat_app/data/services/api/model/customer_resource/customer_resource.dart';
import 'package:automaat_app/data/services/api/model/inspection/inspection.dart';
import 'package:automaat_app/data/services/api/model/car_list/car_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "rental.freezed.dart";

part "rental.g.dart";

@freezed
class Rental with _$Rental {
  const factory Rental({
    required int id,
    required String code,
    required double longitude,
    required double latitude,
    required String fromDate,
    required String toDate,
    RentalState? state,
    List<Inspection>? inspections,
    CustomerResource? customer,
    Car? car,
  }) = _Rental;

  factory Rental.fromJson(Map<String, Object?> json) => _$RentalFromJson(json);
}

enum RentalState {
  @JsonValue("ACTIVE")
  active,
  @JsonValue("RESERVED")
  reserved,
  @JsonValue("PICKUP")
  pickup,
  @JsonValue("RETURNED")
  returned
}
