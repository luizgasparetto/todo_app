import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../dtos/delete_task_dto.dart';
import '../repositories/i_task_repository.dart';

abstract class IDeleteTaskUsecase {
  Future<Either<IAppException, Unit>> call(DeleteTaskDTO params);
}

class DeleteTaskUsecaseImpl implements IDeleteTaskUsecase {
  const DeleteTaskUsecaseImpl(this._taskRepository);
  final ITaskRepository _taskRepository;

  @override
  Future<Either<IAppException, Unit>> call(DeleteTaskDTO params) async {
    return _taskRepository.deleteTask(params);
  }
}
