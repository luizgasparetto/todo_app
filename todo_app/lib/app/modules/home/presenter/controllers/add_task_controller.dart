import 'package:core/core.dart';
import 'package:core/translate/app_localizations.dart';

import '../../domain/dtos/create_task_dto.dart';
import '../stores/add_task_store.dart';

class AddTaskController {
  AddTaskController(this.addTaskStore);

  final AddTaskStore addTaskStore;

  Future<void> addTask(AppLocalizations localizations) async {
    final params = CreateTaskDTO(
      name: task!,
      createAt: DateTime.now(),
      updateAt: DateTime.now(),
      deadlineAt: selectedDateValue,
      localizations: localizations,
    );

    await addTaskStore.createTask(params);
  }
  
  final taskInstance = Task();
  String? get task => taskInstance.value;
  set task(String? value) => taskInstance.value = value;

  DateTime selectedDateValue = DateTime.now();
}
