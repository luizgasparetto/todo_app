import 'dart:convert';

import 'package:core/core.dart';

import '../../domain/dtos/create_task_dto.dart';
import '../../domain/dtos/delete_task_dto.dart';
import '../../domain/dtos/edit_task_dto.dart';
import '../../domain/entities/task_entity.dart';
import '../../infra/datasources/i_task_remote_datasource.dart';
import '../mappers/create_task_mapper.dart';

import '../mappers/edit_task_mapper.dart';
import '../mappers/task_entity_mapper.dart';

class TaskRemoteDatasourceImpl implements ITaskRemoteDatasource {
  const TaskRemoteDatasourceImpl(this._clientService);
  final IClientService _clientService;

  @override
  Future<TaskEntity> createTask(CreateTaskDTO params) async {
    try {
      final result = await _clientService.post(AppApiConstants.createTodoPoint, CreateTaskMapper.toJson(params));

      return TaskEntityMapper.fromMap(
        (result.data is String ? jsonDecode(result.data as String) : result.data) as Map<String, dynamic>,
      );
    } on IAppException {
      rethrow;
    } catch (e, s) {
      throw DatasourceException(message: e.toString(), stackTrace: s);
    }
  }

  @override
  Future<List<TaskEntity>> getListTasks() async {
    try {
      final result = await _clientService.get(AppApiConstants.todoListEndPoint);

      final list =
          result.data is String ? jsonDecode(result.data as String) as List<dynamic> : result.data as List<dynamic>;

      return list.map((e) => TaskEntityMapper.fromMap(e as Map<String, dynamic>)).toList();
    } on IAppException {
      rethrow;
    } catch (e, s) {
      throw DatasourceException(message: e.toString(), stackTrace: s);
    }
  }

  @override
  Future<TaskEntity> editTask(EditTaskDTO params) async {
    try {
      final result = await _clientService.patch(
        AppApiConstants.updateTodoEndPoint(params.id),
        EditTaskMapper.toMap(params),
      );

      return TaskEntityMapper.fromMap(
        (result.data is String ? jsonDecode(result.data as String) : result.data) as Map<String, dynamic>,
      );
    } on IAppException {
      rethrow;
    } catch (e, s) {
      throw DatasourceException(message: e.toString(), stackTrace: s);
    }
  }

  @override
  Future<void> deleteTask(DeleteTaskDTO params) async {
    try {
      await _clientService.delete(AppApiConstants.deleteTodoEndPoint(params.id));
    } on IAppException {
      rethrow;
    } catch (e, s) {
      throw DatasourceException(message: e.toString(), stackTrace: s);
    }
  }
}
