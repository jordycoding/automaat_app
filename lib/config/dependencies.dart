import 'package:automaat_app/data/repositories/auth/auth_repository.dart';
import 'package:automaat_app/data/repositories/auth/auth_repository_remote.dart';
import 'package:automaat_app/data/services/api/api_client.dart';
import 'package:automaat_app/data/services/api/auth_api_client.dart';
import 'package:automaat_app/data/services/shared_preferences_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providers {
  return [
    Provider(
      create: (context) => AuthApiClient(),
    ),
    Provider(
      create: (context) => ApiClient(),
    ),
    Provider(
      create: (context) => SharedPreferencesService(),
    ),
    ChangeNotifierProvider(
      create: (context) => AuthRepositoryRemote(
        apiClient: context.read(),
        authApiClient: context.read(),
        sharedPreferencesService: context.read(),
      ) as AuthRepository,
    )
  ];
}
