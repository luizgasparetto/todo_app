import 'package:flutter_test/flutter_test.dart';

import 'package:todo_do_app/main.dart' as app;

import '../utils/add_task.dart';
import '../utils/binding.dart';
import '../utils/delete_task.dart';
import '../utils/edit_task.dart';
import '../utils/logout.dart';
import '../utils/register.dart';

void main() {
  createBinding();

  group(
    'Register User End-2-End Test | ',
    () {
      testWidgets(
        'should create an user on register page and interact with the app',
        (tester) async {
          app.main();
          await registerIntoTheApp(tester);

          await addTaskIntoTheApp(tester);

          await editTaskIntoTheApp(tester);

          await deleteTaskIntoTheApp(tester);

          await logoutOfTheApp(tester);
        },
      );
    },
  );
}
