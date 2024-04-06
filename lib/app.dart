import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:study/config/router/app_router.dart';
import 'package:study/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:study/injection/injection_container.dart';

@immutable
final class StudyApp extends StatelessWidget {
  const StudyApp({super.key});

  @override
  Widget build(BuildContext context) {
    GoRouter.optionURLReflectsImperativeAPIs = true;
    final router = AppRouter().config;
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) =>
              sl<AuthenticationBloc>()..add(const AuthenticationStatusCheck()),
        ),
      ],
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) => state is AuthenticationSplash
            ? router.go(RoutePaths.splashPath)
            : null,
        child: MaterialApp.router(
          title: 'Study',
          theme: ThemeData.dark(
            useMaterial3: true,
          ),
          routerConfig: router,
        ),
      ),
    );
  }
}
