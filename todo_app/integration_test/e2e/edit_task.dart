import 'package:flutter_test/flutter_test.dart';

import 'package:todo_do_app/main.dart' as app;

import '../utils/binding.dart';
import '../utils/edit_task.dart';
import '../utils/login.dart';

void main() {
  createBinding();

  group(
    'Edit Task Page Test',
    () {
      testWidgets(
        'should display a edit task page',
        (tester) async {
          app.main();
          await loginIntoTheApp(tester);
          await editTaskIntoTheApp(tester);
        },
      );
    },
  );
}
