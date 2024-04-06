part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial();
}


final class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading();
}

final class AuthenticationSplash extends AuthenticationState {
  const AuthenticationSplash();
}

final class AuthenticationSuccess extends AuthenticationState {
  const AuthenticationSuccess(this.user);
  final User user;
  @override
  List<Object> get props => [user];
}

final class AuthenticationError extends AuthenticationState {
  const AuthenticationError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
