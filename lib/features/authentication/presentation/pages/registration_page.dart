import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:study/core/extension/size_extension.dart';
import 'package:study/core/extension/snackbar_extension.dart';

import 'package:study/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:study/features/authentication/presentation/widgets/email_form_field.dart';
import 'package:study/features/authentication/presentation/widgets/password_form_field.dart';
import 'package:study/features/shared/widgets/custom_app_bar.dart';
import 'package:study/features/shared/widgets/custom_loading_indicator.dart';
part '../mixins/registration_mixin.dart';

@immutable
final class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

final class _RegistrationPageState extends State<RegistrationPage>
    with RegistrationMixin {
  @override
  Widget build(BuildContext context) {
    final registrationPadding = context.height * 0.03;
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) => state is AuthenticationError
          ? context.showCustomSnackBar(state.message)
          : null,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Registration Page',
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _registrationFormKey,
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: registrationPadding),
                    child: EmailFormField(
                      emailController: _emailController,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: registrationPadding),
                    child: PasswordFormField(
                      labelText: 'Password',
                      passwordController: _passwordController,
                      confirmationController: _confirmPasswordController,
                    ),
                  ),
                  PasswordFormField(
                    textInputAction: TextInputAction.send,
                    passwordController: _confirmPasswordController,
                    confirmationController: _passwordController,
                    labelText: 'Confirm Password',
                    onFieldSubmitted: (_) => addRegistrationEvent(),
                  ),
                  Gap(registrationPadding),
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                      return (state is AuthenticationLoading)
                          ? const CustomLoadingIndicator()
                          : ElevatedButton(
                              onPressed: addRegistrationEvent,
                              child: const Text('Register'),
                            );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
