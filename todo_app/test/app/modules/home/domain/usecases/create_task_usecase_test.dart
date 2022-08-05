import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_do_app/app/modules/home/domain/dtos/create_task_dto.dart';
import 'package:todo_do_app/app/modules/home/domain/entities/task_entity.dart';
import 'package:todo_do_app/app/modules/home/domain/repositories/i_task_repository.dart';
import 'package:todo_do_app/app/modules/home/domain/usecases/create_task_usecase.dart';

class TaskRepositoryMock extends Mock implements ITaskRepository {}

void main() {
  late final ITaskRepository repository;
  late final ICreateTaskUsecase sut;

  final CreateTaskDTO createTaskDTO = CreateTaskDTO(
    createAt: DateTime.now(),
    deadlineAt: DateTime(DateTime.now().year + 1),
    updateAt: DateTime.now(),
  );

  setUpAll(() {
    repository = TaskRepositoryMock();
    sut = CreateTaskUsecaseImpl(repository);
  });

  setUp(() {
    registerFallbackValue(createTaskDTO);
  });
  group('CreateTask Usecase | ', () {
    test('should return a TaskEntity when create a task successfuly', () async {
      when(() => repository.createTask(any())).thenAnswer(
        (_) async => Right(
          TaskEntity(
            createAt: DateTime.now(),
            deadlineAt: DateTime.now(),
            updateAt: DateTime.now(),
          ),
        ),
      );

      final result = await sut(createTaskDTO);

      verify(() => repository.createTask(any())).called(1);
      expect(result.fold(id, id), isA<TaskEntity>());
    });

    test('should return an DomainException when failed to edit a task', () async {
      when(() => repository.createTask(any())).thenAnswer(
        (_) async => Left(DomainException(message: 'error', stackTrace: StackTrace.current)),
      );

      final result = await sut(
        CreateTaskDTO(createAt: DateTime.now(), updateAt: DateTime.now(), deadlineAt: DateTime.now()),
      );

      expect(result.fold(id, id), isA<DomainException>());
    });
  });
}
