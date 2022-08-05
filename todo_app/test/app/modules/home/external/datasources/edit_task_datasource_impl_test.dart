// ignore_for_file: require_trailing_commas

import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_do_app/app/modules/home/domain/dtos/edit_task_dto.dart';
import 'package:todo_do_app/app/modules/home/domain/entities/task_entity.dart';
import 'package:todo_do_app/app/modules/home/external/datasources/task_remote_datasource_impl.dart';
import 'package:todo_do_app/app/modules/home/infra/datasources/i_task_remote_datasource.dart';

import '../../../../utils/data.dart';

class IClientMock extends Mock implements IClientService {}

void main() {
  late final IClientMock clientMock;
  late final ITaskRemoteDatasource sut;

  setUpAll(() {
    clientMock = IClientMock();
    sut = TaskRemoteDatasourceImpl(clientMock);
  });

  final EditTaskDTO dto = EditTaskDTO(
    deadlineAt: DateTime.now(),
    updateAt: DateTime.now(),
  );
  group('EditTask Datasource | ', () {
    test('should return a TaskEntity in Datasource', () async {
      when(() => clientMock.patch(any(), any())).thenAnswer(
        (_) async => const ClientResponse(data: jsonResponseEditTask),
      );
      final result = await sut.editTask(dto);

      expect(result, isA<TaskEntity>());
    });

    test('should return a Mapper Error when getting an invalid json Error: TaskMapperException', () {
      when(() => clientMock.patch(any(), any())).thenAnswer(
        (_) async => const ClientResponse(data: jsonResponseError),
      );

      final result = sut.editTask(dto);

      expect(result, throwsA(isA<IAppException>()));
    });

    test('should return an Error when receiving an invalid response Error: DataSourceException', () {
      when(() => clientMock.patch(any(), any())).thenThrow(
        DatasourceException(message: '', stackTrace: StackTrace.current),
      );

      final result = sut.editTask(dto);

      expect(result, throwsA(isA<IAppException>()));
    });
  });
}
