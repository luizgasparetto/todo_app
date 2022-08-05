import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_do_app/app/modules/home/domain/dtos/get_all_tasks_dto.dart';
import 'package:todo_do_app/app/modules/home/domain/entities/task_entity.dart';
import 'package:todo_do_app/app/modules/home/domain/repositories/i_task_repository.dart';
import 'package:todo_do_app/app/modules/home/domain/usecases/get_list_tasks_usecase.dart';

class TaskRepositoryMock extends Mock implements ITaskRepository {}

void main() {
  late final ITaskRepository repository;
  late final IGetListTasksUsecase sut;

  setUpAll(() {
    repository = TaskRepositoryMock();
    sut = GetListTasksUsecaseImpl(repository);
  });

  setUp(() {
    registerFallbackValue(const GetAllTasksDTO());
  });

  group('GetListTasks Usecase | ', () {
    test('should return a List<TasksEntity> when the json comes valid', () async {
      when(() => repository.getListTasks(any())).thenAnswer(
        (_) async => const Right(<TaskEntity>[]),
      );

      final result = await sut(const GetAllTasksDTO());

      expect(result.fold(id, id), isA<List<TaskEntity>>());
    });

    test('should return an DomainException when failed to edit a task', () async {
      when(() => repository.getListTasks(any())).thenAnswer(
        (_) async => Left(DomainException(message: 'error', stackTrace: StackTrace.current)),
      );

      final result = await sut(const GetAllTasksDTO());

      expect(result.fold(id, id), isA<DomainException>());
    });
  });
}
