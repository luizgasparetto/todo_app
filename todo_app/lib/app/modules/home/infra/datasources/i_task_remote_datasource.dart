import '../../domain/dtos/create_task_dto.dart';
import '../../domain/dtos/delete_task_dto.dart';
import '../../domain/dtos/edit_task_dto.dart';
import '../../domain/entities/task_entity.dart';

abstract class ITaskRemoteDatasource {
  Future<TaskEntity> createTask(CreateTaskDTO params);
  Future<List<TaskEntity>> getListTasks();
  Future<TaskEntity> editTask(EditTaskDTO params);
  Future<void> deleteTask(DeleteTaskDTO params);
}
