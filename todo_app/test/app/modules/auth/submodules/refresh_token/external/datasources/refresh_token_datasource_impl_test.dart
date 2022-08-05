import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:todo_do_app/app/modules/auth/submodules/refresh_token/domain/dtos/refresh_token_dto.dart';
import 'package:todo_do_app/app/modules/auth/submodules/refresh_token/domain/entities/refresh_token_entity.dart';
import 'package:todo_do_app/app/modules/auth/submodules/refresh_token/external/datasources/refresh_token_datasource_impl.dart';
import 'package:todo_do_app/app/modules/auth/submodules/refresh_token/infra/datasources/i_refresh_token_datasource.dart';

import '../../../../../../utils/data.dart';

class IClientMock extends Mock implements IClientService {}

void main() {
  late final IClientService client;
  late final IRefreshTokenDatasource sut;

  setUpAll(() {
    client = IClientMock();
    sut = RefreshTokenDatasourceImpl(client);
  });

  group('RefreshToken Datasource | ', () {
    test('should return a RefreshTokenEntity in Datasource', () async {
      when(() => client.get(any())).thenAnswer(
        (_) async => const ClientResponse(data: jsonResponseRefreshToken),
      );

      final result = await sut.getRefreshToken(const RefreshTokenDTO());

      expect(result, isA<RefreshTokenEntity>());
    });

    test('should return a Mapper Error when getting an invalid json Error: RefreshTokenMapperException', () {
      when(() => client.get(any())).thenAnswer(
        (_) async => const ClientResponse(data: jsonResponseError),
      );

      final result = sut.getRefreshToken(const RefreshTokenDTO());

      expect(result, throwsA(isA<IAppException>()));
    });

    test('should return an Error when receiving an invalid response Error: DataSourceException', () {
      when(() => client.get(any())).thenThrow(
        DatasourceException(message: '', stackTrace: StackTrace.current),
      );

      final result = sut.getRefreshToken(const RefreshTokenDTO());

      expect(result, throwsA(isA<IAppException>()));
    });
  });
}
