import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:study/injection/injection_container.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: false, // default
  asExtension: true, // default
)
void configureDependecies() => sl.init();
