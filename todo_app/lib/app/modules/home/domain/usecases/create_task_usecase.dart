import 'package:core/shared/failures/i_app_exception.dart';
import 'package:dartz/dartz.dart';

import '../dtos/create_task_dto.dart';
import '../entities/task_entity.dart';
import '../repositories/i_task_repository.dart';

abstract class ICreateTaskUsecase {
  Future<Either<IAppException, TaskEntity>> call(CreateTaskDTO params);
}

class CreateTaskUsecaseImpl implements ICreateTaskUsecase {
  const CreateTaskUsecaseImpl(this._taskRepository);
  final ITaskRepository _taskRepository;

  @override
  Future<Either<IAppException, TaskEntity>> call(CreateTaskDTO params) async {
    return _taskRepository.createTask(params);
  }
}
