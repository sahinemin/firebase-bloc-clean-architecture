import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:study/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:study/features/authentication/presentation/pages/authentication.dart';
import 'package:study/features/home/presentation/pages/home_page.dart';
import 'package:study/features/shared/widgets/splash_page.dart';

final class AppRouter {
  factory AppRouter() => _instance;

  AppRouter._();
  static final AppRouter _instance = AppRouter._();
  final _config = GoRouter(
    redirect: (context, state) {
      if (context.read<AuthenticationBloc>().user == null &&
          (state.fullPath != RoutePaths.loginPath &&
              state.fullPath != RoutePaths.registrationPath &&
              state.fullPath != RoutePaths.splashPath)) {
        return RoutePaths.splashPath;
      }

      return null;
    },
    initialLocation: RoutePaths.splashPath,
    routes: <RouteBase>[
      GoRoute(
        path: RoutePaths.splashPath,
        builder: (context, state) => SplashPage(
          currentPath: Uri.base.path,
        ),
      ),
      GoRoute(
        path: RoutePaths.loginPath,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: RoutePaths.registrationPath,
        builder: (context, state) => const RegistrationPage(),
      ),
      GoRoute(
        path: RoutePaths.homePath,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );

  GoRouter get config => _config;
}

final class RoutePaths {
  static const String loginPath = '/login';
  static const String registrationPath = '/register';
  static const String homePath = '/home';
  static const String splashPath = '/';
}
