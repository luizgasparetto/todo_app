import 'package:core/core.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import '../dtos/edit_task_dto.dart';
import '../entities/task_entity.dart';
import '../repositories/i_task_repository.dart';

abstract class IEditTaskUsecase {
  Future<Either<IAppException, TaskEntity>> call(EditTaskDTO params);
}

class EditTaskUsecaseImpl implements IEditTaskUsecase {
  const EditTaskUsecaseImpl(this._taskRepository);
  final ITaskRepository _taskRepository;

  @override
  Future<Either<IAppException, TaskEntity>> call(EditTaskDTO params) async {
    return _taskRepository.editTask(params);
  }
}
