import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:study/config/router/app_router.dart';
import 'package:study/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:study/features/shared/widgets/custom_app_bar.dart';
import 'package:study/features/shared/widgets/custom_loading_indicator.dart';

final class SplashPage extends StatelessWidget {
  const SplashPage({
    required this.currentPath,
    super.key,
  });
  final String currentPath;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationSuccess) {
          context.go(
            currentPath == RoutePaths.splashPath ||
                    currentPath == RoutePaths.loginPath ||
                    currentPath == RoutePaths.registrationPath
                ? RoutePaths.homePath
                : currentPath,
          );
        } else if (state is AuthenticationInitial) {
          context.go(RoutePaths.loginPath);
        }
      },
      child: const Scaffold(
        appBar: CustomAppBar(title: 'Splash Page'),
        body: CustomLoadingIndicator(),
      ),
    );
  }
}
