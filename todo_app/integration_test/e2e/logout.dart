import 'package:flutter_test/flutter_test.dart';

import 'package:todo_do_app/main.dart' as app;

import '../utils/binding.dart';
import '../utils/login.dart';
import '../utils/logout.dart';

void main() {
  createBinding();

  group(
    'Logout Test',
    () {
      testWidgets(
        'should logout on app',
        (tester) async {
          app.main();

          await loginIntoTheApp(tester);
          await logoutOfTheApp(tester);
        },
      );
    },
  );
}
