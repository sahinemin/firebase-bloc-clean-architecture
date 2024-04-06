import 'package:study/core/utils/typedef.dart';
import 'package:study/features/authentication/domain/entities/authentication_entity.dart';

abstract interface class AuthenticationRepository {
  RemoteCallResult<void> register({
    required AuthenticationEntity registrationEntity,
  });
  RemoteCallResult<void> login({
    required AuthenticationEntity loginEntity,
  });
}
