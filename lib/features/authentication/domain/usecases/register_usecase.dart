import 'package:injectable/injectable.dart';
import 'package:study/core/usecase/usecase.dart';
import 'package:study/core/utils/typedef.dart';
import 'package:study/features/authentication/domain/entities/authentication_entity.dart';
import 'package:study/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:study/features/authentication/domain/usecases/email_password_params.dart';

@injectable
final class RegisterUseCase extends UseCase<void, EmailPasswordParams> {
  RegisterUseCase(this.repository);
  final AuthenticationRepository repository;

  @override
  RemoteCallResult<void> call(EmailPasswordParams params) {
    return repository.register(
      registrationEntity: AuthenticationEntity(
        email: params.email,
        password: params.password,
      ),
    );
  }
}
