import 'package:flutter_test/flutter_test.dart';

import 'package:todo_do_app/main.dart' as app;

import '../utils/binding.dart';
import '../utils/home.dart';
import '../utils/login.dart';

void main() {
  createBinding();

  group(
    'Home Page Test',
    () {
      testWidgets(
        'should verify if HomePage is displayed',
        (tester) async {
          app.main();
          await loginIntoTheApp(tester);
          await verifyHomeIntoTheApp(tester);
        },
      );
    },
  );
}
