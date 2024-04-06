part of '../pages/login_page.dart';

mixin LoginMixin on State<LoginPage> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  void addLoginEvent() {
    if (!_loginFormKey.currentState!.validate()) {
      return;
    }
    context.read<AuthenticationBloc>().add(
          LoginEvent(
            _emailController.text,
            _passwordController.text,
          ),
        );
  }

  void navigateToRegistrationPage() =>
      context.push(RoutePaths.registrationPath);
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _loginFormKey.currentState?.dispose();
    super.dispose();
  }
}
