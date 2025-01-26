import 'package:automaat_app/data/repositories/rental/rental_repository.dart';
import 'package:automaat_app/data/services/api/model/rental/rental.dart';
import 'package:automaat_app/utils/command.dart';
import 'package:automaat_app/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class PastRentalsViewModel extends ChangeNotifier {
  PastRentalsViewModel(
      {required RentalRepository rentalRepository, required this.customerId})
      : _rentalRepository = rentalRepository {
    getRentals = Command0<List<Rental>>(_getRentals);
  }

  final RentalRepository _rentalRepository;
  final String? customerId;
  final _log = Logger("PastRentalsViewModel");
  List<Rental> _rentals = [];

  List<Rental> get rentals => _rentals;

  late Command0 getRentals;

  Future<Result<List<Rental>>> _getRentals() async {
    if (customerId != null) {
      final result = await _rentalRepository.getRentals(int.parse(customerId!));
      switch (result) {
        case Ok<List<Rental>>():
          _rentals = result.value
              .where((rental) => rental.state == RentalState.returned)
              .toList();
          notifyListeners();
        case Error<List<Rental>>():
          _log.warning("Error fetching past rentals");
      }
      return result;
    }
    return Result.error(Exception("No customer id provided"));
  }
}
