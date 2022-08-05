import 'package:core/shared/failures/i_app_exception.dart';
import 'package:dartz/dartz.dart';
import '../dtos/create_task_dto.dart';
import '../dtos/delete_task_dto.dart';
import '../dtos/edit_task_dto.dart';
import '../dtos/get_all_tasks_dto.dart';
import '../entities/task_entity.dart';

abstract class ITaskRepository {
  Future<Either<IAppException, TaskEntity>> createTask(CreateTaskDTO params);
  Future<Either<IAppException, List<TaskEntity>>> getListTasks(GetAllTasksDTO params);
  Future<Either<IAppException, TaskEntity>> editTask(EditTaskDTO params);
  Future<Either<IAppException, Unit>> deleteTask(DeleteTaskDTO params);
}
