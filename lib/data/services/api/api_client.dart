import 'dart:io';
import 'package:automaat_app/config/constants.dart';
import 'package:automaat_app/data/services/api/model/car_list/car_list.dart';
import 'package:automaat_app/data/services/api/model/car_list_holder/car_list_holder.dart';
import 'package:automaat_app/data/services/api/model/customer_resource/customer_resource.dart';
import 'package:automaat_app/data/services/api/model/id_holder/id_holder.dart';
import 'package:automaat_app/data/services/api/model/post_inspection_request/post_inspection_request.dart';
import 'package:automaat_app/data/services/api/model/post_inspection_response/post_inspection_response.dart';
import 'package:automaat_app/data/services/api/model/rental/rental.dart';
import 'package:automaat_app/data/services/api/model/rental_list_holder/rental_list_holder.dart';
import 'package:automaat_app/data/services/api/model/rental_location_patch/rental_location_patch.dart';
import 'package:automaat_app/data/services/shared_preferences_service.dart';
import 'package:automaat_app/utils/http_delegate.dart';
import 'package:automaat_app/utils/result.dart';

typedef AuthHeaderProvider = String? Function();

class ApiClient with HttpDelegate {
  ApiClient({
    required SharedPreferencesService sharedPreferencesService,
    HttpClient Function()? clientFactory,
  })  : _clientFactory = clientFactory ?? HttpClient.new,
        _sharedPreferencesService = sharedPreferencesService;

  final HttpClient Function() _clientFactory;
  final SharedPreferencesService _sharedPreferencesService;
  AuthHeaderProvider? _authHeaderProvider;

  set authHeaderProvider(AuthHeaderProvider? value) {
    _authHeaderProvider = value;
  }

  Future<void> _authHeader(HttpHeaders headers) async {
    final header = _authHeaderProvider?.call();
    if (header != null) {
      headers.add(HttpHeaders.authorizationHeader, header);
    }
  }

  // Auto endpoints
  Future<Result<List<Car>>> getCars() async {
    return getRequest(
      Uri.parse("${AppConstants.serverUrl}/cars"),
      _clientFactory,
      null,
      (List<Object?> json) => (CarListHolder.fromJson({"data": json}).data),
      _authHeader,
      false,
      null,
      _sharedPreferencesService,
    );
  }

  Future<Result<Car>> getCarDetails(int carId) async {
    return getRequest(
      Uri.parse("${AppConstants.serverUrl}/cars/$carId"),
      _clientFactory,
      Car.fromJson,
      null,
      _authHeader,
    );
  }

  // Customer endpoints
  Future<Result<CustomerResource>> customerMe() async {
    return getRequest(
        Uri.parse("${AppConstants.serverUrl}/AM/me"),
        _clientFactory,
        CustomerResource.fromJson,
        null,
        _authHeader,
        false,
        null,
        _sharedPreferencesService);
  }

  // Auth check
  Future<Result<String>> checkAuth() {
    return getRequest<String>(
      Uri.parse("${AppConstants.serverUrl}/authenticate"),
      _clientFactory,
      null,
      null,
      _authHeader,
      true,
    );
  }

  Future<Result<Rental>> createRental({
  required int carId,
  required int customerId,
  required DateTime startDate,
  required DateTime endDate,
  required double currentLatitude,
  required double currentLongitude,
}) async {
  return postRequest(
    Uri.parse("${AppConstants.serverUrl}/rentals"),
    _clientFactory,
    {
      'carId': carId,
      'customerId': customerId,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    },
    (json) {
      final Map<String, dynamic> adjusted = Map<String, dynamic>.from(json);
      adjusted['fromDate'] ??= startDate.toIso8601String();
      adjusted['toDate'] ??= endDate.toIso8601String();
      adjusted['code'] ??= "RESERVED";
      adjusted['longitude'] ??= currentLongitude;
      adjusted['latitude'] ??= currentLatitude;
      adjusted['state'] ??= "RESERVED";

      return Rental.fromJson(adjusted);
    },
    null,
    null,
    RequestType.json,
    _authHeader,
  );
}

  Future<Result<Rental>> patchRentalLocation({
    required int rentalId,
    required double latitude,
    required double longitude,
  }) async {
    return patchRequest(
      Uri.parse("${AppConstants.serverUrl}/rentals/$rentalId"),
      _clientFactory,
      RentalLocationPatch(
        id: rentalId,
        longitude: longitude,
        latitude: latitude,
      ),
      Rental.fromJson,
      null,
      _authHeader,
    );
  }

  Future<Result<List<Rental>>> getRentals(int customerId) async {
    return getRequest(
      Uri.parse("${AppConstants.serverUrl}/rentals").replace(
        queryParameters: {
          "customerId.equals": customerId.toString(),
        },
      ),
      _clientFactory,
      null,
      (List<Object?> json) => (RentalListHolder.fromJson({"data": json}).data),
      _authHeader,
      false,
      null,
      _sharedPreferencesService,
    );
  }

  Future<Result<void>> deleteRental(int rentalId) async {
    return deleteRequest(
        Uri.parse("${AppConstants.serverUrl}/rentals/$rentalId"),
        _clientFactory,
        _authHeader);
  }

  Future<Result<PostInspectionResponse>> createInspection({
    required String code,
    required int odometer,
    required String result,
    required String description,
    required String photo,
    required String photoContentType,
    required String completed,
    required IdHolder car,
  }) async {
    final body = PostInspectionRequest(
      code: code,
      odometer: odometer,
      result: result,
      description: description,
      photo: photo,
      photoContentType: photoContentType,
      completed: completed,
      photos: null,
      repairs: null,
      car: car,
      employee: null,
      rental: null,
    );
    return postRequest(
      Uri.parse("${AppConstants.serverUrl}/inspections"),
      _clientFactory,
      body,
      PostInspectionResponse.fromJson,
      null,
      null,
      RequestType.json,
      _authHeader,
    );
  }
}
