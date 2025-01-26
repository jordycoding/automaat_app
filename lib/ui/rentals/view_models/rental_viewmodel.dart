import 'package:automaat_app/data/repositories/profile/profile_repository.dart';
import 'package:automaat_app/data/repositories/rental/rental_repository.dart';
import 'package:automaat_app/data/services/api/model/customer_resource/customer_resource.dart';
import 'package:automaat_app/data/services/api/model/rental/rental.dart';
import 'package:automaat_app/utils/command.dart';
import 'package:automaat_app/utils/result.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class RentalViewModel extends ChangeNotifier {
  RentalViewModel(
      {required RentalRepository rentalRepository,
      required ProfileRepository profileRepository})
      : _rentalRepository = rentalRepository,
        _profileRepository = profileRepository {
    getRentals = Command0<List<Rental>>(_getRentals);
  }

  final RentalRepository _rentalRepository;
  final ProfileRepository _profileRepository;
  final _log = Logger("RentalViewModel");
  late Command0 getRentals;
  List<Rental> _rentals = [];

  List<Rental> get rentals => _rentals;

  Future<Result<List<Rental>>> _getRentals() async {
    final profile = await _profileRepository.getProfile();
    if (profile is Ok<CustomerResource>) {
      final result = await _rentalRepository.getRentals(profile.value.id);
      _log.info("Fetching rentals for ${profile.value.id}");
      switch (result) {
        case Ok<List<Rental>>():
          _log.info("Fetched rentals");
          _rentals = result.value.where((rental) {
            DateTime parsedDate = DateTime.parse(rental.toDate);
            // Only show rentals with to dates in the future
            return parsedDate.isAfter(DateTime.now()) &&
                rental.state != RentalState.returned;
          }).toList();
          notifyListeners();

        case Error<List<Rental>>():
          _log.warning("Error fetching rentals");
      }
      return result;
    }
    _log.warning("No customer found");
    return Result.error(Exception("Could not find customer id"));
  }
}
