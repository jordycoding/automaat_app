import 'package:automaat_app/data/repositories/rental/rental_repository.dart';
import 'package:automaat_app/data/services/api/model/id_holder/id_holder.dart';
import 'package:automaat_app/data/services/api/model/post_inspection_response/post_inspection_response.dart';
import 'package:automaat_app/utils/command.dart';
import 'package:automaat_app/utils/result.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class InspectionViewmodel extends ChangeNotifier {
  InspectionViewmodel({required RentalRepository rentalRepository})
      : _rentalRepository = rentalRepository {
    postInspection = Command1<
        PostInspectionResponse,
        (
          String code,
          String odometer,
          String resultText,
          String description,
          String date,
          String photo,
          String photoContentType,
          int carId,
        )>(_postInspection);
  }

  final RentalRepository _rentalRepository;
  final _log = Logger("InspectionViewModel");
  PostInspectionResponse? _response = null;

  late Command1 postInspection;
  PostInspectionResponse? get response => _response;

  Future<Result<PostInspectionResponse>> _postInspection(
      (
        String,
        String,
        String,
        String,
        String,
        String,
        String,
        int,
      ) data) async {
    final (
      code,
      odometer,
      resultText,
      description,
      date,
      photo,
      photoContentType,
      carId
    ) = data;

    final result = await _rentalRepository.createInspection(
      code: code,
      odometer: int.parse(odometer),
      result: resultText,
      description: description,
      photo: photo,
      photoContentType: photoContentType,
      completed: date,
      car: IdHolder(id: carId),
    );
    switch (result) {
      case Ok<PostInspectionResponse>():
        _response = result.value;
        notifyListeners();
      case Error<PostInspectionResponse>():
        _log.warning("Error creating inspection");
    }
    return result;
  }
}
