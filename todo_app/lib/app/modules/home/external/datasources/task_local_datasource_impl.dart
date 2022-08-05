import 'dart:convert';

import 'package:core/core.dart';
import 'package:core/user/external/mappers/user_entity_mapper.dart';
import 'package:todo_do_app/app/modules/home/external/mappers/task_database_mapper.dart';

import '../../domain/dtos/create_task_dto.dart';
import '../../domain/dtos/delete_task_dto.dart';
import '../../domain/dtos/edit_task_dto.dart';
import '../../domain/entities/task_entity.dart';
import '../../infra/datasources/i_task_local_datasource.dart';
import '../mappers/task_entity_mapper.dart';

class TaskLocalDatasourceImpl implements ITaskLocalDatasource {
  const TaskLocalDatasourceImpl(this._storage, this._connectionService, this._user);

  final ILocalStorageService _storage;
  final IConnectionService _connectionService;
  final IGetUserInfoUsecase _user;

  @override
  Future<TaskEntity> createTask(CreateTaskDTO params) async {
    late UserEntity user;

    try {
      await _user.call()
        ..fold((l) => l, (r) => user = r);

      final tasksJson = await _storage.getString(const LocalDatabaseGetStringDTO(key: 'tasks'));

      final tasks = user.tasks.map((e) => TaskEntityMapper.toMap(e)).toList();
      final currentTaskId = await this.getCurrentTaskId();

      List newList = [];

      final task = TaskEntity(
        id: params.id ?? currentTaskId + 1,
        name: params.name,
        done: params.done,
        createAt: params.createAt,
        deadlineAt: params.deadlineAt,
        updateAt: params.updateAt,
      );

      final taskJsonEncoded = TaskEntityMapper.toMap(task);

      user.tasks.isNotEmpty ? newList = [...tasks, taskJsonEncoded] : newList.add(taskJsonEncoded);

      final newUser = jsonEncode(
        UserEntityMapper.toMap(
          (user).copyWith(tasks: newList.map((e) => TaskEntityMapper.fromMap(e as Map<String, dynamic>)).toList()),
        ),
      );

      if (!_connectionService.isOnline) {
        if (tasksJson != null) {
          final tasks = jsonDecode(tasksJson) as Map<String, dynamic>;

          final createTasks = tasks['create'] as List;
          final editTask = tasks['edit'] as List;
          final deleteTask = tasks['delete'] as List;

          createTasks.add(taskJsonEncoded);

          await _storage.setString(
            LocalDatabaseSetStringDTO(
              key: AppLocalConstants.tasksKey,
              value: jsonEncode(TaskDatabaseMapper.toMap(create: createTasks, edit: editTask, delete: deleteTask)),
            ),
          );
        } else {
          await _storage.setString(
            LocalDatabaseSetStringDTO(
              key: AppLocalConstants.tasksKey,
              value: jsonEncode(TaskDatabaseMapper.toMap(create: [taskJsonEncoded])),
            ),
          );
        }
      }

      await _storage.setString(LocalDatabaseSetStringDTO(key: AppLocalConstants.userKey, value: newUser));

      return task;
    } catch (e, st) {
      throw DatasourceException(message: e.toString(), stackTrace: st);
    }
  }

  @override
  Future<List<TaskEntity>> getListTasks({List<TaskEntity>? list}) async {
    late UserEntity user;

    try {
      await _user.call()
        ..fold((l) => null, (r) => user = r);

      if (list == null) return user.tasks;

      final listA = list.map((e) => TaskEntityMapper.toMap(e)).toList();

      _storage.setString(
        LocalDatabaseSetStringDTO(
          key: AppLocalConstants.userKey,
          value: jsonEncode(
            UserEntityMapper.toMap(
              (user).copyWith(tasks: listA.map((e) => TaskEntityMapper.fromMap(e)).toList()),
            ),
          ),
        ),
      );

      return list;
    } catch (e, st) {
      throw DatasourceException(message: e.toString(), stackTrace: st);
    }
  }

  @override
  Future<TaskEntity> editTask(EditTaskDTO params) async {
    late UserEntity user;
    late final TaskEntity editedTask;
    final List<Map<String, dynamic>> list = [];

    try {
      await _user.call()
        ..fold((l) => l, (r) => user = r);

      final tasksJson = await _storage.getString(LocalDatabaseGetStringDTO(key: AppLocalConstants.tasksKey));

      final tasks = await getListTasks();

      for (var task in tasks) {
        if (task.id == params.id) {
          task = task.copyWith(
            name: params.name,
            done: params.done,
            updateAt: params.updateAt,
            deadlineAt: params.deadlineAt,
          );

          editedTask = task;
        }

        list.add(TaskEntityMapper.toMap(task));
      }

      if (!_connectionService.isOnline) {
        if (tasksJson != null) {
          final tasks = jsonDecode(tasksJson) as Map<String, dynamic>;

          final createTasks = tasks['create'] as List;
          final editTasks = tasks['edit'] as List;
          final deleteTasks = tasks['delete'] as List;

          editTasks.add(TaskEntityMapper.toMap(editedTask));

          await _storage.setString(
            LocalDatabaseSetStringDTO(
              key: AppLocalConstants.tasksKey,
              value: jsonEncode(TaskDatabaseMapper.toMap(create: createTasks, edit: editTasks, delete: deleteTasks)),
            ),
          );
        } else {
          await _storage.setString(
            LocalDatabaseSetStringDTO(
              key: AppLocalConstants.tasksKey,
              value: jsonEncode(TaskDatabaseMapper.toMap(edit: [TaskEntityMapper.toMap(editedTask)])),
            ),
          );
        }
      }

      final newUser = jsonEncode(
        UserEntityMapper.toMap(
          (user).copyWith(tasks: list.map((e) => TaskEntityMapper.fromMap(e)).toList()),
        ),
      );

      await _storage.setString(LocalDatabaseSetStringDTO(key: AppLocalConstants.userKey, value: newUser));

      return editedTask;
    } catch (e, st) {
      throw DatasourceException(message: e.toString(), stackTrace: st);
    }
  }

  @override
  Future<void> deleteTask(DeleteTaskDTO params) async {
    late UserEntity user;
    List<Map<String, dynamic>> tasks = [];
    late final TaskEntity deletedTask;

    try {
      await _user.call()
        ..fold((l) => l, (userEntity) => user = userEntity);

      final tasksJson = await _storage.getString(LocalDatabaseGetStringDTO(key: AppLocalConstants.tasksKey));

      final currentTasks = await getListTasks();

      for (var task in currentTasks) {
        if (task.id != params.id) {
          tasks.add(TaskEntityMapper.toMap(task));
        } else {
          deletedTask = task;
        }
      }

      if (!_connectionService.isOnline) {
        if (tasksJson != null) {
          final tasks = jsonDecode(tasksJson) as Map<String, dynamic>;

          final createTasks = tasks['create'] as List;
          final editTasks = tasks['edit'] as List;
          final deletedTasks = tasks['delete'] as List;

          deletedTasks.add(TaskEntityMapper.toMap(deletedTask));

          await _storage.setString(
            LocalDatabaseSetStringDTO(
              key: AppLocalConstants.tasksKey,
              value: jsonEncode(TaskDatabaseMapper.toMap(create: createTasks, edit: editTasks, delete: deletedTasks)),
            ),
          );
        } else {
          await _storage.setString(
            LocalDatabaseSetStringDTO(
              key: AppLocalConstants.tasksKey,
              value: jsonEncode(TaskDatabaseMapper.toMap(delete: [TaskEntityMapper.toMap(deletedTask)])),
            ),
          );
        }
      }

      final newUser = jsonEncode(UserEntityMapper.toMap(
        (user).copyWith(tasks: tasks.map((e) => TaskEntityMapper.fromMap(e)).toList()),
      ));

      await _storage.setString(LocalDatabaseSetStringDTO(key: AppLocalConstants.userKey, value: newUser));
    } catch (e, st) {
      throw DatasourceException(message: e.toString(), stackTrace: st);
    }
  }

  Future<int> getCurrentTaskId() async {
    final tasks = await getListTasks();

    if (tasks.isEmpty) return 0;

    tasks.sort((a, b) => b.id.compareTo(a.id));

    return tasks.first.id;
  }
}
