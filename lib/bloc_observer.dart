import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:study/core/logger/logger.dart';
import 'package:study/injection/injection_container.dart';

@immutable
final class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    sl<BaseLogger>().debugLog(
      'onChange(${bloc.runtimeType}, $change)',
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    sl<BaseLogger>().errorLog(
      'onError(${bloc.runtimeType}, $error, $stackTrace)',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
