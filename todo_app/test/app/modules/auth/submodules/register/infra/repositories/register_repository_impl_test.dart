import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:todo_do_app/app/modules/auth/submodules/register/domain/dtos/register_with_email_dto.dart';
import 'package:todo_do_app/app/modules/auth/submodules/register/infra/datasources/i_register_with_email_datasource.dart';
import 'package:todo_do_app/app/modules/auth/submodules/register/infra/repositories/register_with_email_repository_impl.dart';

class RegisterWithEmailDatasourceMock extends Mock implements IRegisterWithEmailDatasource {}

void main() {
  final datasource = RegisterWithEmailDatasourceMock();
  final sut = RegisterWithEmailRepositoryImpl(datasource);

  setUp(() {
    registerFallbackValue(const RegisterWithEmailDTO());
  });

  group('RegisterWithEmail Repository | ', () {
    test('should return a UserEntity when passed valid data', () async {
      when(() => datasource.registerWithEmail(any())).thenAnswer((_) async => UserEntity());

      final result = await sut.registerWithEmail(const RegisterWithEmailDTO());

      expect(result.fold(id, id), isA<UserEntity>());
    });

    test('should return a DatasourceError if the Datasource fails', () async {
      when(() => datasource.registerWithEmail(any())).thenThrow(
        DatasourceException(message: 'message', stackTrace: StackTrace.current),
      );

      final result = await sut.registerWithEmail(const RegisterWithEmailDTO());

      expect(result.fold(id, id), isA<DatasourceException>());
    });
  });
}
