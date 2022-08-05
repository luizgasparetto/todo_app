import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_do_app/app/modules/auth/submodules/refresh_token/domain/dtos/refresh_token_dto.dart';
import 'package:todo_do_app/app/modules/auth/submodules/refresh_token/domain/entities/refresh_token_entity.dart';
import 'package:todo_do_app/app/modules/auth/submodules/refresh_token/domain/repositories/i_refresh_token_repository.dart';
import 'package:todo_do_app/app/modules/auth/submodules/refresh_token/infra/datasources/i_refresh_token_datasource.dart';
import 'package:todo_do_app/app/modules/auth/submodules/refresh_token/infra/repositories/refresh_token_repository_impl.dart';

class RefreshTokenDatasourceMock extends Mock implements IRefreshTokenDatasource {}

void main() {
  late final IRefreshTokenDatasource datasource;
  late final IRefreshTokenRepository sut;

  setUpAll(() {
    datasource = RefreshTokenDatasourceMock();
    sut = RefreshTokenRepositoryImpl(datasource);
  });

  setUp(() {
    registerFallbackValue(const RefreshTokenDTO());
  });

  group('RefreshToken Repository | ', () {
    test('should return a RefreshTokenEntity when passed valid data', () async {
      when(() => datasource.getRefreshToken(any())).thenAnswer((_) async => const RefreshTokenEntity());

      final result = await sut.getRefreshToken(const RefreshTokenDTO());

      expect(result.fold(id, id), isA<RefreshTokenEntity>());
    });

    test('should return a DatasourceError if the Datasource fails', () async {
      when(() => datasource.getRefreshToken(any())).thenThrow(
        DatasourceException(message: 'message', stackTrace: StackTrace.current),
      );

      final result = await sut.getRefreshToken(const RefreshTokenDTO());

      expect(result.fold(id, id), isA<DatasourceException>());
    });
  });
}
