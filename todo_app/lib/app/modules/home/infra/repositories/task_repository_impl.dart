import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../domain/dtos/create_task_dto.dart';
import '../../domain/dtos/delete_task_dto.dart';
import '../../domain/dtos/edit_task_dto.dart';

import '../../domain/dtos/get_all_tasks_dto.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/repositories/i_task_repository.dart';
import '../datasources/i_task_local_datasource.dart';
import '../datasources/i_task_remote_datasource.dart';

class TaskRepositoryImpl implements ITaskRepository {
  const TaskRepositoryImpl(this._taskRemoteDatasource, this._taskLocalDatasource, this._connectionService);

  final ITaskRemoteDatasource _taskRemoteDatasource;
  final ITaskLocalDatasource _taskLocalDatasource;
  final IConnectionService _connectionService;

  @override
  Future<Either<IAppException, TaskEntity>> createTask(CreateTaskDTO params) async {
    final TaskEntity result;

    try {
      if (!kIsWeb) {
        if (_connectionService.isOnline) {
          result = await _taskRemoteDatasource.createTask(params);

          params.id = result.id;

          await _taskLocalDatasource.createTask(params);
        } else {
          result = await _taskLocalDatasource.createTask(params);
        }
      } else {
        result = await _taskRemoteDatasource.createTask(params);
      }

      return Right(result);
    } on IAppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<IAppException, List<TaskEntity>>> getListTasks(GetAllTasksDTO params) async {
    final List<TaskEntity> tasks;

    try {
      if (!kIsWeb) {
        if (_connectionService.isOnline) {
          tasks = await _taskRemoteDatasource.getListTasks();
          await _taskLocalDatasource.getListTasks(list: tasks);
        } else {
          tasks = await _taskLocalDatasource.getListTasks();
        }
      } else {
        tasks = await _taskRemoteDatasource.getListTasks();
      }

      if (params.searchText == null || params.searchText!.isEmpty) {
        return Right(tasks);
      }

      final filtredList =
          tasks.where((task) => task.name.toLowerCase().contains(params.searchText!.toLowerCase())).toList();

      return Right(filtredList);
    } on IAppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<IAppException, TaskEntity>> editTask(EditTaskDTO params) async {
    final TaskEntity result;

    try {
      if (!kIsWeb) {
        if (_connectionService.isOnline) {
          result = await _taskRemoteDatasource.editTask(params);
          await _taskLocalDatasource.editTask(params);
        } else {
          result = await _taskLocalDatasource.editTask(params);
        }
      } else {
        result = await _taskRemoteDatasource.editTask(params);
      }

      return Right(result);
    } on IAppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<IAppException, Unit>> deleteTask(DeleteTaskDTO params) async {
    try {
      if (!kIsWeb) {
        if (_connectionService.isOnline) {
          await _taskRemoteDatasource.deleteTask(params);
          await _taskLocalDatasource.deleteTask(params);
        } else {
          await _taskLocalDatasource.deleteTask(params);
        }
      } else {
        await _taskRemoteDatasource.deleteTask(params);
      }
      return const Right(unit);
    } on IAppException catch (e) {
      return Left(e);
    }
  }
}
