import 'package:core/core.dart';
import 'package:core/translate/app_localizations.dart';

import '../../domain/dtos/edit_task_dto.dart';
import '../stores/edit_task_store.dart';

class EditTaskController {
  EditTaskController(this.editTaskStore);

  final EditTaskStore editTaskStore;

  Future<void> editTask(int id, AppLocalizations localizations) async {
    final params = EditTaskDTO(
      id: id,
      name: task!,
      deadlineAt: selectedDateValue,
      localizations: localizations,
    );

    await editTaskStore.editTask(params);
  }

  DateTime selectedDateValue = DateTime.now();

  final taskInstance = Task();
  String? get task => taskInstance.value;
  set task(String? value) => taskInstance.value = value;
}
