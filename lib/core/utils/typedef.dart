import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:study/core/error/failure.dart';
import 'package:study/core/logger/logger.dart';
import 'package:study/injection/injection_container.dart';

typedef RemoteCallResult<T> = Future<Either<Failure, T>>;

final class RemoteRequest {
  static RemoteCallResult<T> makeRequest<T>(
    Future<T> Function() request,
    String requestName,
  ) async {
    try {
      final result = await request();
      sl.get<BaseLogger>().infoLog(
            'Request successful \n Request: $requestName \n Result: $result',
            time: DateTime.now(),
          );

      return Right(result);
    } on FirebaseException catch (e) {
      sl.get<BaseLogger>().errorLog(
            '''FirebaseException: $e \n FirebaseException code: ${e.code}\n FirebaseException message: ${e.message}''',
            stackTrace: e.stackTrace,
          );
      return Left(FirebaseFailure(e.message.toString()));
    } catch (e) {
      sl.get<BaseLogger>().errorLog('Exception: $e');
      return Left(ServerFailure(e.toString()));
    }
  }
}
