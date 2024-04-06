import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study/bloc_observer.dart';
import 'package:study/firebase_options.dart';
import 'package:study/injection/injection_container.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
) async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependecies();
  Bloc.observer = const AppBlocObserver();
  setPathUrlStrategy();
  await Future.wait([
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
  ]);
  if (kIsWeb) {
    await FirebaseAuth.instance.setPersistence(Persistence.INDEXED_DB);
  }
  runApp(await builder());
}
