import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:todo_do_app/app/modules/home/domain/dtos/delete_task_dto.dart';
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
  group('DeleteTask Datasource | ', () {
    test('should call delete method one time', () async {
      when(() => clientMock.delete(any())).thenAnswer(
        (_) async => const ClientResponse(data: jsonResponseDeleteTask),
      );

      await sut.deleteTask(DeleteTaskDTO());

      verify(() => clientMock.delete(any())).called(1);
    });

    test('should return an Error when receiving an invalid response Error: DataSourceException', () {
      when(() => clientMock.delete(any())).thenThrow(
        DatasourceException(message: '', stackTrace: StackTrace.current),
      );

      final result = sut.deleteTask(DeleteTaskDTO());

      expect(result, throwsA(isA<IAppException>()));
    });
  });
}
