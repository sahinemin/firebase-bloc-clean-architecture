part of '../pages/registration_page.dart';

mixin RegistrationMixin on State<RegistrationPage> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _registrationFormKey = GlobalKey<FormState>();

  void addRegistrationEvent() {
    if (!_registrationFormKey.currentState!.validate()) {
      return;
    }
    context.read<AuthenticationBloc>().add(
          RegistrationEvent(
            _emailController.text,
            _passwordController.text,
          ),
        );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _registrationFormKey.currentState?.dispose();
    super.dispose();
  }
}
