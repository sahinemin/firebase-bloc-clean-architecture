import 'package:equatable/equatable.dart';

final class ServerException extends Equatable implements Exception {
  const ServerException(this.message);
  final String message;

  @override
  List<Object?> get props => [
        message,
      ];
}
