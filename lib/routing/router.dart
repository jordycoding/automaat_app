import 'package:automaat_app/config/dependencies.dart';
import 'package:automaat_app/data/repositories/auth/auth_repository.dart';
import 'package:automaat_app/data/repositories/car_list/car_repository.dart';
import 'package:automaat_app/routing/app_routes.dart';
import 'package:automaat_app/ui/car_list/view_model/car_list_viewmodel.dart';
import 'package:automaat_app/ui/car_list/widgets/car_list_screen.dart';
import 'package:automaat_app/ui/home/widgets/home_screen.dart';
import 'package:automaat_app/ui/login/view_models/login_viewmodel.dart';
import 'package:automaat_app/ui/login/widgets/login_screen.dart';
import 'package:automaat_app/ui/register/view_models/register_viewmodel.dart';
import 'package:automaat_app/ui/register/widgets/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

GoRouter router(AuthRepository authRepository) => GoRouter(
      initialLocation: AppRoutes.login,
      debugLogDiagnostics: true,
      redirect: _redirect,
      refreshListenable: authRepository,
      routes: [
        GoRoute(
          path: AppRoutes.login,
          builder: (context, state) => LoginScreen(
            viewModel: LoginViewmodel(
              authRepository: context.read(),
            ),
          ),
        ),
        GoRoute(
          path: AppRoutes.register,
          builder: (context, state) => RegisterScreen(
            viewModel: RegisterViewmodel(
              authRepository: context.read(),
            ),
          ),
        ),
        GoRoute(
          path: AppRoutes.carList,
          builder: (context, state) => ChangeNotifierProvider(
            create: (_) => CarListViewModel(
              // Haal de repository direct uit de widget tree
              context.read<CarRepository>(),
            )..loadCars(),
            child: const CarListScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.home,
          builder: (context, state) => const HomeScreen(),
        )
      ],
    );

Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  final loggedIn = await context.read<AuthRepository>().isAuthenticated;
  final loggingIn = state.matchedLocation == AppRoutes.login;

  // If not logged in, go to login page
  if (!loggedIn) {
    return AppRoutes.login;
  }

  // // If logged in but still on login page, go to home
  if (loggingIn) {
    return AppRoutes.home;
  }
  return null;
}
