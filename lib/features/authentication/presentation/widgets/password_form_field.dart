import 'package:flutter/material.dart';
import 'package:study/features/shared/widgets/custom_form_field.dart';

final class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    required this.passwordController,
    required this.labelText,
    this.confirmationController,
    this.onFieldSubmitted,
    this.textInputAction = TextInputAction.next,
    super.key,
  });

  final TextEditingController? confirmationController;
  final String labelText;
  final TextEditingController passwordController;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: TextInputType.visiblePassword,
      autofillHints: const [AutofillHints.password],
      textInputAction: textInputAction,
      prefixIcon: const Icon(Icons.lock),
      validator: (value) {
        if (value!.length < 6) {
          return 'Password must be at least 6 characters long';
        } else if (confirmationController != null &&
            value != confirmationController!.text) {
          return 'Passwords do not match';
        }
        return null;
      },
      obscureText: true,
      labelText: labelText,
      controller: passwordController,
    );
  }
}
