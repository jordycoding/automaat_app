import 'package:automaat_app/data/repositories/auth/auth_repository.dart';
import 'package:automaat_app/data/repositories/car_list/car_repository.dart';
import 'package:automaat_app/routing/app_routes.dart';
import 'package:automaat_app/ui/car_list/view_model/car_list_viewmodel.dart';
import 'package:automaat_app/ui/car_list/widgets/car_list_screen.dart';
import 'package:automaat_app/ui/profile/view_models/past_rentals_viewmodel.dart';
import 'package:automaat_app/ui/profile/view_models/profile_viewmodel.dart';
import 'package:automaat_app/ui/profile/widgets/past_rentals_screen.dart';
import 'package:automaat_app/ui/profile/widgets/profile_screen.dart';
import 'package:automaat_app/ui/core/ui/scaffold_nested_navigation.dart';
import 'package:automaat_app/ui/home/widgets/home_screen.dart';
import 'package:automaat_app/ui/login/view_models/login_viewmodel.dart';
import 'package:automaat_app/ui/login/widgets/login_screen.dart';
import 'package:automaat_app/ui/register/view_models/register_viewmodel.dart';
import 'package:automaat_app/ui/register/widgets/register_screen.dart';
import 'package:automaat_app/ui/car_detail/view_model/car_detail_viewmodel.dart';
import 'package:automaat_app/ui/car_detail/widgets/car_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: "shellHome");
final _shellNavigatoProfileKey =
    GlobalKey<NavigatorState>(debugLabel: "shellProfile");
final _shellNavigatorCarsKey =
    GlobalKey<NavigatorState>(debugLabel: "shellCars");

GoRouter router(AuthRepository authRepository) => GoRouter(
      initialLocation: AppRoutes.login,
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      redirect: _redirect,
      refreshListenable: authRepository,
      routes: [
        GoRoute(
          path: '${AppRoutes.carDetails}/:carId',
          builder: (context, state) {
            final carId = int.parse(state.pathParameters['carId']!);
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => CarDetailViewModel(
                    repository: context.read<CarRepository>(),
                    carId: carId,
                  ),
                ),
              ],
              child: const CarDetailScreen(),
            );
          },
        ),
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
            viewModel: RegisterViewModel(
              authRepository: context.read(),
            ),
          ),
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNestedNavigation(
                navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _shellNavigatorHomeKey,
              routes: [
                GoRoute(
                  path: AppRoutes.home,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: HomeScreen(),
                  ),
                )
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatoProfileKey,
              routes: [
                GoRoute(
                  path: AppRoutes.profile,
                  pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    child: ChangeNotifierProvider(
                      create: (context) => ProfileViewModel(
                        profileRepository: context.read(),
                        authRepository: context.read(),
                      ),
                      child: Builder(
                        builder: (context) {
                          final profileViewModel =
                              context.read<ProfileViewModel>();
                          return ProfileScreen(
                            viewModel: profileViewModel,
                          );
                        },
                      ),
                    ),
                  ),
                  routes: [
                    GoRoute(
                      path: "pastRentals/:customerId",
                      pageBuilder: (context, state) {
                        final customerId = state.pathParameters["customerId"];
                        return MaterialPage(
                          key: state.pageKey,
                          child: ChangeNotifierProvider(
                            create: (context) => PastRentalsViewModel(
                              rentalRepository: context.read(),
                              customerId: customerId,
                            ),
                            child: Builder(
                              builder: (context) {
                                final pastRentalsViewModel =
                                    context.read<PastRentalsViewModel>();
                                return PastRentalsScreen(
                                    viewModel: pastRentalsViewModel);
                              },
                            ),
                          ),
                        );
                      },
                    )
                  ],
                )
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorCarsKey,
              routes: [
                GoRoute(
                  path: AppRoutes.carList,
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: ChangeNotifierProvider(
                      create: (context) => CarListViewModel(
                        repository: context.read<CarRepository>(),
                      )..loadCars(),
                      child: const CarListScreen(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );

Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  final loggedIn = await context.read<AuthRepository>().isAuthenticated;
  final loggingIn = state.matchedLocation == AppRoutes.login;
  final registering = state.matchedLocation == AppRoutes.register;

  // If not logged in, go to login page
  if (!loggedIn && !registering) {
    return AppRoutes.login;
  }

  // // If logged in but still on login page, go to home
  if (loggingIn) {
    return AppRoutes.home;
  }
  return null;
}
