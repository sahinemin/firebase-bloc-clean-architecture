import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study/features/authentication/presentation/bloc/authentication_bloc.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => addLogoutEvent(context),
      icon: const Icon(Icons.logout),
    );
  }

  void addLogoutEvent(BuildContext context) {
    return context.read<AuthenticationBloc>().add(const LogoutEvent());
  }
}
