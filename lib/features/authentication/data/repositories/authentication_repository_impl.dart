import 'package:study/core/utils/typedef.dart';
import 'package:study/features/authentication/data/datasources/authentication_datasource.dart';
import 'package:study/features/authentication/domain/entities/authentication_entity.dart';
import 'package:study/features/authentication/domain/repositories/authentication_repository.dart';
// ignore: directives_ordering
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthenticationRepository)
final class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl(
    this.authenticationDataSource,
  );
  final AuthenticationDataSource authenticationDataSource;

  @override
  RemoteCallResult<void> register({
    required AuthenticationEntity registrationEntity,
  }) async {
    return RemoteRequest.makeRequest(
      () => authenticationDataSource.register(
        registrationEntity: registrationEntity,
      ),
      'Registration Request',
    );
  }

  @override
  RemoteCallResult<void> login({
    required AuthenticationEntity loginEntity,
  }) async {
    return RemoteRequest.makeRequest(
      () => authenticationDataSource.login(
        loginEntity: loginEntity,
      ),
      'Login Request',
    );
  }
}
