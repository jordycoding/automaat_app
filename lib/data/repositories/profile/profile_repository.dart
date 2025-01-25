import 'package:automaat_app/data/services/api/model/customer_resource/customer_resource.dart';
import 'package:automaat_app/utils/result.dart';
import 'package:flutter/foundation.dart';

abstract class ProfileRepository extends ChangeNotifier{
    Future<Result<CustomerResource>> getProfile();
}
