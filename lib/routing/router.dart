import 'package:automaat_app/data/repositories/auth/auth_repository.dart';
import 'package:automaat_app/routing/app_routes.dart';
import 'package:automaat_app/ui/car_list/car_list_screen.dart';
import 'package:automaat_app/ui/login/widgets/login_screen.dart';
import 'package:automaat_app/ui/register/view_models/register_viewmodel.dart';
import 'package:automaat_app/ui/register/widgets/register_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

GoRouter router(
  AuthRepository authRepository,
) =>
    GoRouter(
        initialLocation: AppRoutes.login,
        debugLogDiagnostics: true,
        routes: [
          GoRoute(
            path: AppRoutes.login,
            builder: (context, state) {
              return LoginScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.register,
            builder: (context, state) {
              return RegisterScreen(
                viewModel: RegisterViewmodel(
                  authRepository: context.read(),
                ),
              );
            },
          ),
          GoRoute(
            path: AppRoutes.carList,
            builder: (context, state) {
              return CarListScreen();
            },
          ),
        ]);
