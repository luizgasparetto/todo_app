import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_do_app/app/modules/home/domain/dtos/delete_task_dto.dart';
import 'package:todo_do_app/app/modules/home/domain/repositories/i_task_repository.dart';

import 'package:todo_do_app/app/modules/home/domain/usecases/delete_task_usecase.dart';

class TaskRepositoryMock extends Mock implements ITaskRepository {}

void main() {
  late final ITaskRepository repository;
  late final IDeleteTaskUsecase sut;

  setUpAll(() {
    repository = TaskRepositoryMock();
    sut = DeleteTaskUsecaseImpl(repository);
  });

  setUp(() {
    registerFallbackValue(DeleteTaskDTO());
  });
  group('DeleteTask Usecase | ', () {
    test('should return Unit when deleted a task with success', () async {
      when(() => repository.deleteTask(any())).thenAnswer((_) async => const Right(unit));

      final result = await sut(DeleteTaskDTO());

      verify(() => repository.deleteTask(any())).called(1);
      expect(result.fold(id, id), equals(unit));
    });

    test('should return an DomainException when failed to delete a task', () async {
      when(() => repository.deleteTask(any())).thenAnswer(
        (_) async => Left(DomainException(message: 'error', stackTrace: StackTrace.current)),
      );

      final result = await sut(DeleteTaskDTO());

      expect(result.fold(id, id), isA<DomainException>());
    });
  });
}
