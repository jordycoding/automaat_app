import 'dart:convert';
import 'dart:io';

import 'package:automaat_app/config/constants.dart';
import 'package:automaat_app/data/services/api/model/car_list/car_list.dart';
import 'package:automaat_app/utils/http_delegate.dart';
import 'package:automaat_app/utils/result.dart';
import 'package:logging/logging.dart';

class CarApiClient with HttpDelegate {
  CarApiClient({HttpClient Function()? clientFactory})
      : _clientFactory = clientFactory ?? HttpClient.new;

  final HttpClient Function() _clientFactory;
  final _log = Logger("CarApiClient");

    Future<Result<List<Car>>> getCars() async {
    final result = await getRequest<List<Car>>(
      Uri.parse("${AppConstants.serverUrl}/api/cars"),
      _clientFactory,
      (dynamic json) {
        try {
          if (json is! List) throw const FormatException('Expected list of cars');
          
          return json
              .map<Car>((e) => Car.fromJson(e as Map<String, dynamic>))
              .toList();
        } catch (e) {
          _log.severe('JSON parsing error: $e');
          throw const FormatException('Invalid car data');
        }
      },
    );

    return switch (result) {
      Ok<List<Car>?>(value: final cars) => Result.ok(cars ?? []), 
      Error<List<Car>?>(error: final e) => Result.error(e),
      _ => Result.error(Exception('Unexpected result type')), 
    };
  }
}