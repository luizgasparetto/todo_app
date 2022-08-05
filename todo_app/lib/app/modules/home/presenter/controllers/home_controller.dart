import 'dart:convert';

import 'package:core/core.dart';
import 'package:core/translate/app_localizations.dart';
import 'package:dartz/dartz.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:todo_do_app/app/modules/home/domain/dtos/create_task_dto.dart';
import 'package:todo_do_app/app/modules/home/domain/dtos/delete_task_dto.dart';
import 'package:todo_do_app/app/modules/home/domain/dtos/edit_task_dto.dart';
import 'package:todo_do_app/app/modules/home/domain/dtos/get_all_tasks_dto.dart';
import 'package:todo_do_app/app/modules/home/domain/entities/task_entity.dart';
import 'package:todo_do_app/app/modules/home/domain/usecases/create_task_usecase.dart';
import 'package:todo_do_app/app/modules/home/domain/usecases/delete_task_usecase.dart';
import 'package:todo_do_app/app/modules/home/domain/usecases/edit_task_usecase.dart';
import 'package:todo_do_app/app/modules/home/domain/usecases/get_list_tasks_usecase.dart';
import 'package:todo_do_app/app/modules/home/external/mappers/task_database_mapper.dart';
import 'package:todo_do_app/app/modules/home/external/mappers/task_entity_mapper.dart';
import 'package:tads_design_system/tads_design_system.dart';
import 'package:todo_do_app/app/modules/home/presenter/stores/states/task_state.dart';
import 'package:todo_do_app/app/modules/home/presenter/stores/task_store.dart';

class HomeController {
  HomeController(
    this._connectionService,
    this._overlayService,
    this.authStore,
    this.taskStore,
    this._localStorageService,
    this._createTaskUsecase,
    this._editTaskUsecase,
    this._deleteTaskUsecase,
    this._getListTasksUsecase,
    this._localNotificationService,
  );

  final IConnectionService _connectionService;
  final IOverlayService _overlayService;
  final AuthStore authStore;
  final TaskStore taskStore;
  final ILocalStorageService _localStorageService;
  final ICreateTaskUsecase _createTaskUsecase;
  final IEditTaskUsecase _editTaskUsecase;
  final IDeleteTaskUsecase _deleteTaskUsecase;
  final IGetListTasksUsecase _getListTasksUsecase;
  final ILocalNotificationService _localNotificationService;
  final _debouncer = Debouncer(milliseconds: 500);

  void gotoEditTask(TaskEntity task) => Modular.to.pushNamed(AppRoutes.toEditTask, arguments: task);

  Future<void> updateCompletedList(TaskEntity task) async {
    _debouncer.run(() async {
      _updateCompletedListSync(task);
      _updateCompletedListAsync(task);
    });
  }

  void _updateCompletedListSync(TaskEntity task) {
    if (!kIsWeb) {
      _localNotificationService.deleteNotification(task.id);
    }
    taskStore.updateList(
      taskStore.state.copyWith(
        completedTasks: taskStore.state.completedTasks..add(task.copyWith(done: true)),
        tasks: taskStore.state.tasks..removeWhere((t) => t.id == task.id),
      ),
    );
  }

  Future<void> _updateCompletedListAsync(TaskEntity task) async {
    final result = await _editTaskUsecase(
      EditTaskDTO(
        deadlineAt: DateTime.now(),
        updateAt: DateTime.now(),
        done: true,
        id: task.id,
        name: task.name,
      ),
    );
    if (result.isLeft()) {
      result.fold((l) => _overlayService.showErrorSnackBar(l.message), id);
    }
  }

  void updateTasksList(TaskEntity task, AppLocalizations localizations) {
    if (CustomTime.isAfter(DateTime.now(), task.deadlineAt)) {
      _debouncer.run(() {
        _updateTaskListSync(task, localizations);
        _updateTaskListAsync(task);
      });
    } else {
      _overlayService.showErrorSnackBar(
        localizations.errorStatusChange,
      );
    }
  }

  void deleteCompletedTaskItem(TaskEntity task) {
    _deleteCompletedTaskItemSync(task);
    _deleteCompletedTaskItemAsync(task);
  }

  void _deleteCompletedTaskItemSync(TaskEntity task) {
    if (!kIsWeb) {
      _localNotificationService.deleteNotification(task.id);
    }
    final completedTask = taskStore.state.completedTasks..removeWhere((t) => t.id == task.id);
    taskStore.updateList(
      taskStore.state.copyWith(
        completedTasks: completedTask,
      ),
    );
  }

  Future<void> _deleteCompletedTaskItemAsync(TaskEntity task) async {
    final result = await _deleteTaskUsecase(
      DeleteTaskDTO(
        id: task.id,
      ),
    );
    if (result.isLeft()) {
      result.fold((l) => _overlayService.showErrorSnackBar(l.message), id);
    }
  }

  void deleteAnTaskItem(TaskEntity task) {
    _deleteAnTaskItemSync(task);
    _deleteAnTaskItemAsync(task);
  }

  Future<void> _deleteAnTaskItemSync(TaskEntity task) async {
    if (!kIsWeb) {
      _localNotificationService.deleteNotification(task.id);
    }
    final tasks = taskStore.state.tasks..removeWhere((e) => e.id == task.id);
    taskStore.updateList(
      taskStore.state.copyWith(
        tasks: tasks,
      ),
    );
  }

  Future<void> _deleteAnTaskItemAsync(TaskEntity task) async {
    final result = await _deleteTaskUsecase(DeleteTaskDTO(id: task.id));
    if (result.isLeft()) {
      result.fold((l) => _overlayService.showErrorSnackBar(l.message), id);
    }
  }

  Future<void> getList({String? searchText, required AppLocalizations localizations}) async {
    await syncTask(localizations);
    taskStore.setLoadingValue(true);
    final result = await _getListTasksUsecase(GetAllTasksDTO(searchText: searchText));

    result.fold(
      (l) => _overlayService.showErrorSnackBar(l.message),
      (r) => taskStore.setList(_organizeList(r, localizations)),
    );
  }

  TaskState _organizeList(List<TaskEntity> list, AppLocalizations localizations) {
    List<TaskEntity> completedTask = [];
    list.map((e) {
      e.done == true ? completedTask.add(e) : null;
    }).toList();
    list.removeWhere((element) => element.done == true);
    if (!kIsWeb) {
      list.map((e) {
        if (CustomTime.isAfter(DateTime.now(), e.deadlineAt)) {
          _localNotificationService.replaceANotification(
            ShowLocalNotificationDTO(
              id: e.id,
              title: '${localizations.notificationTitle} ${e.name}',
              endDate: e.deadlineAt,
              body: localizations.notificationBody,
              secondBody: localizations.notificationSecondBody,
            ),
          );
        }
      }).toList();
    }

    return TaskState(list, completedTask, isSyncing: false);
  }

  Future<void> syncTask(AppLocalizations localizations) async {
    final taskJson = await _localStorageService.getString(const LocalDatabaseGetStringDTO(key: 'tasks'));

    List createTask = [];
    List deleteTask = [];
    List editTask = [];

    if (_connectionService.isOnline) {
      if (taskJson != null) {
        final resultMap = jsonDecode(taskJson);
        final create =
            (resultMap['create'] as List).map((e) => TaskEntityMapper.fromMap(e as Map<String, dynamic>)).toList();
        final edit =
            (resultMap['edit'] as List).map((e) => TaskEntityMapper.fromMap(e as Map<String, dynamic>)).toList();
        final delete =
            (resultMap['delete'] as List).map((e) => TaskEntityMapper.fromMap(e as Map<String, dynamic>)).toList();

        if (create.isNotEmpty || edit.isNotEmpty || delete.isNotEmpty) {
          taskStore.syncTasks(true);
          await Future.wait(
            create.map((e) async {
              final result = await _createTaskUsecase(
                CreateTaskDTO(
                  createAt: e.createAt,
                  updateAt: e.updateAt,
                  done: e.done,
                  name: e.name,
                  deadlineAt: e.deadlineAt,
                  localizations: localizations,
                ),
              );
              result.fold((l) => createTask.add(TaskEntityMapper.toMap(e)), id);
            }).toList(),
          );

          await Future.wait(
            edit.map((e) async {
              final result = await _editTaskUsecase(
                EditTaskDTO(
                  id: e.id,
                  done: e.done,
                  name: e.name,
                  updateAt: e.updateAt,
                  deadlineAt: e.deadlineAt,
                ),
              );

              result.fold((l) => editTask.add(TaskEntityMapper.toMap(e)), id);
            }).toList(),
          );

          await Future.wait(
            delete.map((e) async {
              final result = await _deleteTaskUsecase(DeleteTaskDTO(id: e.id));

              result.fold((l) => deleteTask.add(TaskEntityMapper.toMap(e)), id);
            }).toList(),
          );
        }

        await _localStorageService.setString(
          LocalDatabaseSetStringDTO(
            key: 'tasks',
            value: jsonEncode(
              TaskDatabaseMapper.toMap(
                create: createTask,
                delete: deleteTask,
                edit: editTask,
              ),
            ),
          ),
        );
        taskStore.syncTasks(false);
      }
    }
  }

  void _updateTaskListSync(TaskEntity task, AppLocalizations localizations) {
    if (!kIsWeb) {
      _localNotificationService.replaceANotification(
        ShowLocalNotificationDTO(
          id: task.id,
          title: '${localizations.notificationTitle} ${task.name}',
          endDate: task.deadlineAt,
          body: localizations.notificationBody,
          secondBody: localizations.notificationSecondBody,
        ),
      );
    }

    taskStore.updateList(
      taskStore.state.copyWith(
        tasks: taskStore.state.tasks..add(task.copyWith(done: false)),
        completedTasks: taskStore.state.completedTasks..remove(task),
      ),
    );
  }

  Future<void> _updateTaskListAsync(TaskEntity task) async {
    final params = EditTaskDTO(
      deadlineAt: DateTime.now(),
      updateAt: DateTime.now(),
      id: task.id,
      name: task.name,
    );

    final result = await _editTaskUsecase(params);

    if (result.isLeft()) {
      result.fold((l) => _overlayService.showErrorSnackBar(l.message), id);
    }
  }

  Future<void> logout(AppLocalizations localizations) async {
    if (_connectionService.isOnline) {
      await authStore.logout();
    } else if (taskStore.state.isSyncing) {
      await _overlayService.showErrorSnackBar(localizations.errorSync);
    } else {
      await _overlayService.showErrorSnackBar(localizations.errorLogoutWithoutInterner);
    }
  }
}
