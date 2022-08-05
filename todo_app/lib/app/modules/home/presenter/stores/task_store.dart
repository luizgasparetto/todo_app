import 'package:core/shared/failures/i_app_exception.dart';
import 'package:dependency_module/dependency_module.dart';

import 'states/task_state.dart';

class TaskStore extends StreamStore<IAppException, TaskState> {
  TaskStore() : super(TaskState.initial());

  Future<void> syncTasks(bool value) async => update(state.copyWith(isSyncing: value));

  void setLoadingValue(bool value) => setLoading(value);

  void setList(TaskState state) async => update(state);

  void updateList(TaskState state) => update(state);
}
