import 'package:core/shared/failures/i_app_exception.dart';
import 'package:dartz/dartz.dart';
import '../dtos/get_all_tasks_dto.dart';
import '../entities/task_entity.dart';
import '../repositories/i_task_repository.dart';

abstract class IGetListTasksUsecase {
  Future<Either<IAppException, List<TaskEntity>>> call(GetAllTasksDTO params);
}

class GetListTasksUsecaseImpl implements IGetListTasksUsecase {
  const GetListTasksUsecaseImpl(this._taskRepository);
  final ITaskRepository _taskRepository;

  @override
  Future<Either<IAppException, List<TaskEntity>>> call(
    GetAllTasksDTO params,
  ) async {
    return _taskRepository.getListTasks(params);
  }
}
