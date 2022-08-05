import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:todo_do_app/app/modules/auth/submodules/login/domain/dtos/login_with_email_dto.dart';
import 'package:todo_do_app/app/modules/auth/submodules/login/infra/datasources/i_login_with_email_datasource.dart';
import 'package:todo_do_app/app/modules/auth/submodules/login/infra/repositories/login_with_email_repository_impl.dart';

class LoginDatasourceMock extends Mock implements ILoginDatasource {}

void main() {
  final datasource = LoginDatasourceMock();
  final sut = LoginRepositoryImpl(datasource);

  setUp(() {
    registerFallbackValue(const LoginWithEmailDTO());
  });

  group('Login Repository | ', () {
    test('should return a UserEntity when passed valid data', () async {
      when(() => datasource.loginWithEmail(any())).thenAnswer(
        (_) async => UserEntity(),
      );

      final result = await sut.loginWithEmail(const LoginWithEmailDTO());

      expect(result.fold(id, id), isA<UserEntity>());
    });

    test('should return a DatasourceError if the Datasource fails', () async {
      when(() => datasource.loginWithEmail(any())).thenThrow(
        DatasourceException(message: 'message', stackTrace: StackTrace.current),
      );

      final result = await sut.loginWithEmail(const LoginWithEmailDTO());

      expect(result.fold(id, id), isA<DatasourceException>());
    });
  });
}
