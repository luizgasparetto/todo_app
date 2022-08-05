import 'package:flutter_test/flutter_test.dart';

import 'package:todo_do_app/main.dart' as app;

import '../utils/binding.dart';
import '../utils/login.dart';

void main() {
  createBinding();

  group(
    'Login Page Test',
    () {
      testWidgets(
        'should display a login page',
        (tester) async {
          app.main();

          await loginIntoTheApp(tester);          
        },
      );
    },
  );
}
