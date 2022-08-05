import 'package:flutter_test/flutter_test.dart';

import 'package:todo_do_app/main.dart' as app;

import '../utils/add_task.dart';
import '../utils/binding.dart';
import '../utils/login.dart';

void main() {
  createBinding();

  group(
    'Add Task Page Test',
    () {
      testWidgets(
        'should create a task on add task page',
        (tester) async {
          app.main();
          await loginIntoTheApp(tester);
          await addTaskIntoTheApp(tester);
        },
      );
    },
  );
}
