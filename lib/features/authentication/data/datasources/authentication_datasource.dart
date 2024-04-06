import 'package:study/features/authentication/domain/entities/authentication_entity.dart';

abstract interface class AuthenticationDataSource {
  Future<void> register({required AuthenticationEntity registrationEntity});
  Future<void> login({required AuthenticationEntity loginEntity});
}
