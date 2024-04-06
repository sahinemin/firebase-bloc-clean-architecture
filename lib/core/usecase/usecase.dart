import 'package:fpdart/fpdart.dart';
import 'package:study/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

//create params class for usecase login with email and password
