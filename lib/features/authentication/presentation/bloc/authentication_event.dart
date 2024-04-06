part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

final class RegistrationEvent extends AuthenticationEvent {
  const RegistrationEvent(
    this.email,
    this.password,
  );
  final String email;
  final String password;

  @override
  List<Object> get props => [
        email,
        password,
      ];
}

final class LoginEvent extends AuthenticationEvent {
  const LoginEvent(
    this.email,
    this.password,
  );
  final String email;
  final String password;

  @override
  List<Object> get props => [
        email,
        password,
      ];
}

final class AuthenticationStatusCheck extends AuthenticationEvent {
  const AuthenticationStatusCheck();
  @override
  List<Object?> get props => [];
}

final class LogoutEvent extends AuthenticationEvent {
  const LogoutEvent();

  @override
  List<Object> get props => [];
}
