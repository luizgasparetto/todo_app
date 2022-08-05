import 'package:flutter_test/flutter_test.dart';

import 'package:todo_do_app/main.dart' as app;

import '../utils/binding.dart';
import '../utils/register.dart';

void main() {
  createBinding();
  group(
    'Register Page Test | ',
    () {
      testWidgets(
        'should create an user on register page',
        (tester) async {
          app.main();
          await registerIntoTheApp(tester);
        },
      );
    },
  );
}
