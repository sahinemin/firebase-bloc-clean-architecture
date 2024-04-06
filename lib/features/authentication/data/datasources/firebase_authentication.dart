import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:study/core/error/exception.dart';
import 'package:study/features/authentication/data/datasources/authentication_datasource.dart';
import 'package:study/features/authentication/domain/entities/authentication_entity.dart';

@LazySingleton(as: AuthenticationDataSource)
final class FirebaseAuthentication implements AuthenticationDataSource {
  FirebaseAuthentication() {
    _firebaseAuth = FirebaseAuth.instance;
  }
  late final FirebaseAuth _firebaseAuth;

  @override
  Future<void> register({
    required AuthenticationEntity registrationEntity,
  }) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: registrationEntity.email,
      password: registrationEntity.password,
    );
    if (result.user == null) throw const ServerException('User not created');
  }

  @override
  Future<void> login({required AuthenticationEntity loginEntity}) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
      email: loginEntity.email,
      password: loginEntity.password,
    );
    if (result.user == null) throw const ServerException('User not found');
  }
}
