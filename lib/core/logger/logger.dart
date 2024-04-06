import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

abstract interface class BaseLogger {
  void traceLog(
    String message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  });

  void debugLog(
    String message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  });

  void infoLog(
    String message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  });

  void warningLog(
    String message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  });

  void errorLog(
    String message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  });

  void fatalLog(
    String message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  });

  void log(
    Level level,
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {}
}

@LazySingleton(as: BaseLogger)
final class CustomLogger implements BaseLogger {
  final Logger _logger = Logger();
  @override
  void traceLog(
    String message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.t(
      'TRACE: $message',
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void debugLog(
    String message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.d(
      'DEBUG: $message',
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void infoLog(
    String message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.i(
      'INFO: $message',
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void warningLog(
    String message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.w(
      'WARNING: $message',
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void errorLog(
    String message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.e(
      'ERROR: $message',
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void fatalLog(
    String message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.e(
      'FATAL: $message',
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void log(
    Level level,
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.log(
      level,
      message,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
