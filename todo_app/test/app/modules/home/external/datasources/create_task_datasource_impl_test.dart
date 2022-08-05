import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:todo_do_app/app/modules/home/domain/dtos/create_task_dto.dart';
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

  final CreateTaskDTO createTaskDTO = CreateTaskDTO(
    createAt: DateTime.now(),
    deadlineAt: DateTime.now(),
    updateAt: DateTime.now(),
  );
  group('CreateTask Datasource | ', () {
    test('should call post method once', () async {
      when(() => clientMock.post(any(), any())).thenAnswer(
        (_) async => const ClientResponse(data: jsonResponseCreateTask),
      );

      await sut.createTask(createTaskDTO);

      verify(() => clientMock.post(any(), any())).called(1);
    });

    test('should return an Error when receiving an invalid response Error: DataSourceException', () {
      when(() => clientMock.post(any(), any())).thenThrow(
        DatasourceException(message: '', stackTrace: StackTrace.current),
      );

      final result = sut.createTask(createTaskDTO);

      expect(result, throwsA(isA<IAppException>()));
    });
  });
}
