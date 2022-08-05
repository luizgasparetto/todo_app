import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_do_app/app/modules/home/domain/dtos/create_task_dto.dart';
import 'package:todo_do_app/app/modules/home/domain/dtos/delete_task_dto.dart';
import 'package:todo_do_app/app/modules/home/domain/dtos/edit_task_dto.dart';
import 'package:todo_do_app/app/modules/home/domain/dtos/get_all_tasks_dto.dart';
import 'package:todo_do_app/app/modules/home/domain/entities/task_entity.dart';
import 'package:todo_do_app/app/modules/home/domain/repositories/i_task_repository.dart';
import 'package:todo_do_app/app/modules/home/infra/datasources/i_task_local_datasource.dart';
import 'package:todo_do_app/app/modules/home/infra/datasources/i_task_remote_datasource.dart';
import 'package:todo_do_app/app/modules/home/infra/repositories/task_repository_impl.dart';

class TaskRemoteDatasourceMock extends Mock implements ITaskRemoteDatasource {}

class TaskLocalDatasourceMock extends Mock implements ITaskLocalDatasource {}

class ConnectionServiceMock extends Mock implements IConnectionService {}

void main() {
  late final ITaskRemoteDatasource taskRemoteDatasource;
  late final ITaskLocalDatasource taskLocalDatasource;
  late final IConnectionService connectionService;
  late final ITaskRepository sut;

  final createTaskDTO = CreateTaskDTO(
    createAt: DateTime.now(),
    deadlineAt: DateTime.now(),
    updateAt: DateTime.now(),
  );

  final editTaskDTO = EditTaskDTO(
    id: 1,
    name: 'Edit Task',
    deadlineAt: DateTime.now(),
    updateAt: DateTime.now(),
  );

  final taskStub = TaskEntity(
    name: 'task',
    createAt: DateTime.now(),
    deadlineAt: DateTime.now(),
    updateAt: DateTime.now(),
  );

  final editTaskStub = TaskEntity(
    name: editTaskDTO.name,
    createAt: DateTime.now(),
    deadlineAt: DateTime.now(),
    updateAt: DateTime.now(),
  );

  setUpAll(() {
    taskRemoteDatasource = TaskRemoteDatasourceMock();
    taskLocalDatasource = TaskLocalDatasourceMock();
    connectionService = ConnectionServiceMock();
    sut = TaskRepositoryImpl(taskRemoteDatasource, taskLocalDatasource, connectionService);
  });

  setUp(() {
    registerFallbackValue(createTaskDTO);
    registerFallbackValue(const GetAllTasksDTO());
    registerFallbackValue(editTaskDTO);
    registerFallbackValue(DeleteTaskDTO());
  });

  group('Task Repository | ', () {
    group('Create Task | ', () {
      test('should return a TaskEntity when passed valid data', () async {
        when(() => connectionService.isOnline).thenAnswer((_) => true);
        when(() => taskRemoteDatasource.createTask(any())).thenAnswer((_) async => taskStub);
        when(() => taskLocalDatasource.createTask(any())).thenAnswer((_) async => taskStub);

        final result = await sut.createTask(createTaskDTO);

        expect(result.fold(id, id), isA<TaskEntity>());
      });

      test('should return a DatasourceError if the Datasource fails', () async {
        when(() => connectionService.isOnline).thenAnswer((_) => true);
        when(() => taskRemoteDatasource.createTask(any())).thenThrow(
          DatasourceException(message: 'message', stackTrace: StackTrace.current),
        );

        final result = await sut.createTask(createTaskDTO);

        expect(result.fold(id, id), isA<IAppException>());
      });
    });

    group('Get Tasks | ', () {
      test('should return a DatasourceError if the Datasource fails', () async {
        when(() => connectionService.isOnline).thenAnswer((_) => true);
        when(() => taskRemoteDatasource.getListTasks()).thenThrow(
          DatasourceException(message: 'message', stackTrace: StackTrace.current),
        );

        final result = await sut.getListTasks(const GetAllTasksDTO());

        expect(result.fold(id, id), isA<IAppException>());
      });
    });

    group('Edit Task | ', () {
      test('should return a TaskEntity when pass with correct data', () async {
        when(() => connectionService.isOnline).thenAnswer((_) => true);
        when(() => taskLocalDatasource.editTask(any())).thenAnswer((_) async => editTaskStub);
        when(() => taskRemoteDatasource.editTask(any())).thenAnswer((_) async => editTaskStub);

        final result = await sut.editTask(editTaskDTO);

        expect(result.fold(id, id), isA<TaskEntity>());
        expect(result.fold(id, (r) => r.name), equals(editTaskDTO.name));
      });

      test('should return a DatasourceError if the Datasource fails', () async {
        when(() => connectionService.isOnline).thenAnswer((_) => true);
        when(() => taskRemoteDatasource.editTask(any())).thenThrow(
          DatasourceException(message: 'message', stackTrace: StackTrace.current),
        );

        final result = await sut.editTask(editTaskDTO);

        expect(result.fold(id, id), isA<IAppException>());
      });
    });

    group('Delete Task | ', () {
      test('should call Delete method on TaskRemoteDatasource one time', () async {
        when(() => connectionService.isOnline).thenAnswer((_) => true);
        when(() => taskLocalDatasource.deleteTask(any())).thenAnswer((_) async {});
        when(() => taskRemoteDatasource.deleteTask(any())).thenAnswer((_) async {});

        await sut.deleteTask(DeleteTaskDTO());

        verify(() => taskRemoteDatasource.deleteTask(any())).called(1);
      });

      test('should return a DatasourceError if the Datasource fails', () async {
        when(() => connectionService.isOnline).thenAnswer((_) => true);
        when(() => taskRemoteDatasource.deleteTask(any())).thenThrow(
          DatasourceException(message: 'message', stackTrace: StackTrace.current),
        );

        final result = await sut.deleteTask(DeleteTaskDTO());

        expect(result.fold(id, id), isA<IAppException>());
      });
    });
  });
}
