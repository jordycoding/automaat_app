import 'package:automaat_app/config/dependencies.dart';
import 'package:automaat_app/data/repositories/auth/auth_repository.dart';
import 'package:automaat_app/data/repositories/car_list/car_repository.dart';
import 'package:automaat_app/routing/app_routes.dart';
import 'package:automaat_app/ui/car_list/view_model/car_list_viewmodel.dart';
import 'package:automaat_app/ui/car_list/widgets/car_list_screen.dart'; 
import 'package:automaat_app/ui/login/view_models/login_viewmodel.dart';
import 'package:automaat_app/ui/login/widgets/login_screen.dart';
import 'package:automaat_app/ui/register/view_models/register_viewmodel.dart';
import 'package:automaat_app/ui/register/widgets/register_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

GoRouter router(AuthRepository authRepository) => GoRouter(
      initialLocation: AppRoutes.login,
      debugLogDiagnostics: true,
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
      ],
    );