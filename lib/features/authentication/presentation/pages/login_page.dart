import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:study/config/router/app_router.dart';
import 'package:study/core/extension/size_extension.dart';
import 'package:study/core/extension/snackbar_extension.dart';
import 'package:study/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:study/features/authentication/presentation/widgets/formfileds.dart';
import 'package:study/features/shared/widgets/custom_app_bar.dart';
import 'package:study/features/shared/widgets/custom_loading_indicator.dart';

part '../mixins/login_mixin.dart';

final class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

final class _LoginPageState extends State<LoginPage> with LoginMixin {
  @override
  Widget build(BuildContext context) {
    final loginPadding = context.height * 0.03;
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) => state is AuthenticationError
          ? context.showCustomSnackBar(state.message)
          : null,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(
          title: 'Login Page',
        ),
        body: Form(
          key: _loginFormKey,
          child: Column(
            children: <Widget>[
              AutofillGroup(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: loginPadding),
                      child: EmailFormField(
                        emailController: _emailController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: loginPadding),
                      child: PasswordFormField(
                        textInputAction: TextInputAction.send,
                        labelText: 'Password',
                        passwordController: _passwordController,
                        onFieldSubmitted: (_) => addLoginEvent(),
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  if (state is AuthenticationLoading) {
                    return const CustomLoadingIndicator();
                  }
                  return Column(
                    children: [
                      ElevatedButton(
                        onPressed: addLoginEvent,
                        child: const Text('Login'),
                      ),
                      Gap(context.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: navigateToRegistrationPage,
                            child: const Text('Register'),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
