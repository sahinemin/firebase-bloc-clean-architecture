import 'package:study/app.dart';
import 'package:study/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const StudyApp());
}
