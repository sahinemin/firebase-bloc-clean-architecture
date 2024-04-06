import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:study/features/authentication/domain/usecases/email_password_params.dart';
import 'package:study/features/authentication/domain/usecases/login_usecase.dart';
import 'package:study/features/authentication/domain/usecases/register_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

@injectable
final class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
    this.registerUseCase,
    this.loginUseCase,
  ) : super(const AuthenticationInitial()) {
    on<AuthenticationStatusCheck>((event, emit) async {
      await emit.onEach(
        FirebaseAuth.instance.authStateChanges(),
        onData: (user) async {
          this.user = user;
          emit(const AuthenticationSplash());
          await Future.delayed(const Duration(seconds: 1), () {
            if (user == null) {
              emit(const AuthenticationInitial());
            } else if (state is! AuthenticationSuccess) {
              emit(AuthenticationSuccess(user));
            }
          });
        },
      );
    });
    on<RegistrationEvent>(
      (event, emit) async => registrationEventHandler(event, emit),
    );
    on<LoginEvent>(
      (event, emit) async => loginEventHandler(event, emit),
    );
    on<LogoutEvent>(
      (event, emit) async => logoutEventHandler(event, emit),
    );
  }

  Future<void> logoutEventHandler(
    AuthenticationEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> registrationEventHandler(
    RegistrationEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const AuthenticationLoading());
    final result = await registerUseCase.call(
      EmailPasswordParams(email: event.email, password: event.password),
    );
    result.fold(
      (l) => emit(AuthenticationError(l.message)),
      (r) => null,
    );
    emit(const AuthenticationInitial());
  }

  Future<void> loginEventHandler(
    LoginEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const AuthenticationLoading());
    final result = await loginUseCase.call(
      EmailPasswordParams(
        email: event.email,
        password: event.password,
      ),
    );
    result.fold(
      (l) => emit(AuthenticationError(l.message)),
      (r) => null,
    );
  }

  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  User? user;
}
