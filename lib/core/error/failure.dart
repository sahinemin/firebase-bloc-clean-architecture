import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const Failure(this.message, {this.statusCode});
  final String message;
  final int? statusCode;
  @override
  List<Object?> get props {
    return [message, statusCode];
  }
}

final class FirebaseFailure extends Failure {
  const FirebaseFailure(super.message, {super.statusCode});
}

final class ServerFailure extends Failure {
  const ServerFailure(super.message, {super.statusCode});
}
