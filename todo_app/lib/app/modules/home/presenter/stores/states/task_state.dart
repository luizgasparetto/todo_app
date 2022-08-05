import '../../../domain/entities/task_entity.dart';

class TaskState {
  factory TaskState.initial() => const TaskState([],[],isSyncing: false);

  const TaskState(this.tasks,this.completedTasks,{required this.isSyncing});
  final List<TaskEntity> tasks;
  final List<TaskEntity> completedTasks;
  final bool isSyncing;

  TaskState copyWith({
    List<TaskEntity>? tasks,
    List<TaskEntity>? completedTasks,
    bool? isSyncing,
  }) {
    return TaskState(
      tasks ?? this.tasks,
      completedTasks ?? this.completedTasks,
      isSyncing: isSyncing ?? this.isSyncing,
    );
  }
}
