// ignore_for_file: require_trailing_commas, depend_on_referenced_packages

import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_do_app/app/modules/home/domain/dtos/edit_task_dto.dart';
import 'package:todo_do_app/app/modules/home/domain/entities/task_entity.dart';
import 'package:todo_do_app/app/modules/home/domain/repositories/i_task_repository.dart';
import 'package:todo_do_app/app/modules/home/domain/usecases/edit_task_usecase.dart';

class TaskRepositoryMock extends Mock implements ITaskRepository {}

void main() {
  late final ITaskRepository repository;
  late final IEditTaskUsecase sut;

  final EditTaskDTO dto = EditTaskDTO(
    deadlineAt: DateTime.now(),
    updateAt: DateTime.now(),
  );

  setUpAll(() {
    repository = TaskRepositoryMock();
    sut = EditTaskUsecaseImpl(repository);
  });

  setUpAll(() {
    registerFallbackValue(dto);
  });
  group('EditTask Usecase | ', () {
    test('should return as TaskEntity when edited a task', () async {
      when(() => repository.editTask(any())).thenAnswer(
        (_) async => Right(TaskEntity(createAt: DateTime.now(), deadlineAt: DateTime.now(), updateAt: DateTime.now())),
      );

      final result = await sut(dto);

      verify(() => repository.editTask(any())).called(1);
      expect(result.fold(id, id), isA<TaskEntity>());
    });

    test('should return an DomainException when failed to edit a task', () async {
      when(() => repository.editTask(any())).thenAnswer(
        (_) async => Left(DomainException(message: 'error', stackTrace: StackTrace.current)),
      );

      final result = await sut(dto);

      expect(result.fold(id, id), isA<DomainException>());
    });
  });
}
