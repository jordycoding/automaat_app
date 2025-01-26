import 'package:automaat_app/data/repositories/rental/rental_repository.dart';
import 'package:automaat_app/utils/command.dart';
import 'package:automaat_app/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class RentalDetailViewmodel extends ChangeNotifier {
  RentalDetailViewmodel({required RentalRepository rentalRepository})
      : _rentalRepository = rentalRepository {
    deleteRental = Command1<void, int>(_deleteRental);
  }

  final RentalRepository _rentalRepository;
  late Command1 deleteRental;
  final _log = Logger("RentalDetailViewmodel");

  Future<Result<void>> _deleteRental(int id) async {
    final result = await _rentalRepository.deleteRental(id);
    switch (result) {
      case Ok<void>():
        notifyListeners();
      case Error<void>():
        _log.warning("Error deleting rental");
    }
    return result;
  }
}
