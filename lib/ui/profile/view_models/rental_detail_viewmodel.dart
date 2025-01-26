import 'package:automaat_app/data/repositories/rental/rental_repository.dart';
import 'package:automaat_app/data/services/api/model/rental/rental.dart';
import 'package:automaat_app/utils/command.dart';
import 'package:automaat_app/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class RentalDetailViewmodel extends ChangeNotifier {
  RentalDetailViewmodel({required RentalRepository rentalRepository})
      : _rentalRepository = rentalRepository {
    deleteRental = Command1<void, int>(_deleteRental);
    patchRentalLocation =
        Command1<void, (int, double, double)>(_patchRentalLocation);
  }

  final RentalRepository _rentalRepository;
  late Command1 deleteRental;
  late Command1 patchRentalLocation;
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

  Future<Result<Rental>> _patchRentalLocation(
      (int, double, double) data) async {
    final (id, lat, long) = data;
    final result = await _rentalRepository.patchRentalLocation(id, lat, long);
    switch (result) {
      case Ok<Rental>():
        notifyListeners();
      case Error<void>():
        _log.warning("Error patching rental location");
    }
    return result;
  }
}
