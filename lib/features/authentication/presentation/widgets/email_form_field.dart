import 'package:flutter/material.dart';
import 'package:study/core/mixins/validator.dart';
import 'package:study/features/shared/widgets/custom_form_field.dart';

final class EmailFormField extends StatelessWidget with Validator {
  const EmailFormField({
    required this.emailController,
    super.key,
  });
  final TextEditingController emailController;
  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      keyboardType: TextInputType.emailAddress,
      prefixIcon: const Icon(Icons.email),
      autofillHints: const [AutofillHints.email],
      labelText: 'Email',
      controller: emailController,
      validator: (value) {
        if (!isValidEmail(value!)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }
}
