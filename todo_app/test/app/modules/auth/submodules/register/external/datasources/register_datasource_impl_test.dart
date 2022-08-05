import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:todo_do_app/app/modules/auth/submodules/register/domain/dtos/register_with_email_dto.dart';
import 'package:todo_do_app/app/modules/auth/submodules/register/external/datasources/register_with_email_datasource_impl.dart';
import 'package:todo_do_app/app/modules/auth/submodules/register/infra/datasources/i_register_with_email_datasource.dart';

import '../../../../../../utils/data.dart';

class ClientMock extends Mock implements IClientService {}

void main() {
  late final IClientService client;
  late final IRegisterWithEmailDatasource sut;

  setUpAll(() {
    client = ClientMock();
    sut = RegisterWithEmailDatasourceImpl(client);
  });

  group('RegisterWithEmail Datasource | ', () {
    test('should return a UserEntity in Datasource', () async {
      when(() => client.post(any(), any(), interceptors: false)).thenAnswer(
        (_) async => const ClientResponse(data: jsonResponseLogin),
      );
      final result = await sut.registerWithEmail(const RegisterWithEmailDTO());

      expect(result, isA<UserEntity>());
    });

    test('should return a MapperError when getting an invalid json Error: RegisterWithEmailMapperException', () {
      when(() => client.post(any(), any(), interceptors: false)).thenAnswer(
        (_) async => const ClientResponse(data: jsonResponseError),
      );

      final result = sut.registerWithEmail(const RegisterWithEmailDTO());

      expect(result, throwsA(isA<IAppException>()));
    });

    test('should return an Error when receiving an invalid response Error: DataSourceException', () {
      when(() => client.post(any(), any(), interceptors: false)).thenThrow(
        DatasourceException(message: '', stackTrace: StackTrace.current),
      );

      final result = sut.registerWithEmail(const RegisterWithEmailDTO());

      expect(result, throwsA(isA<DatasourceException>()));
    });
  });
}
