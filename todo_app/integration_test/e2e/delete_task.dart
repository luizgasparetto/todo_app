import 'package:flutter_test/flutter_test.dart';

import 'package:todo_do_app/main.dart' as app;

import '../utils/binding.dart';
import '../utils/delete_task.dart';
import '../utils/login.dart';

void main() {
  createBinding();

  group(
    'Delete Task Test',
    () {
      testWidgets(
        'should delete a task HomePage',
        (tester) async {
          app.main();
          await loginIntoTheApp(tester);
          await deleteTaskIntoTheApp(tester);
        },
      );
    },
  );
}
