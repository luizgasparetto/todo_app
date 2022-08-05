import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_do_app/app/modules/auth/submodules/register/domain/dtos/register_with_email_dto.dart';
import 'package:todo_do_app/app/modules/auth/submodules/register/domain/repositories/i_register_with_email_repository.dart';
import 'package:todo_do_app/app/modules/auth/submodules/register/domain/usecases/register_with_email_usecase.dart';

class RegisterWithEmailRepositoryMock extends Mock implements IRegisterWithEmailRepository {}

void main() {
  late final IRegisterWithEmailRepository repository;
  late final IRegisterWithEmailUsecase sut;

  setUpAll(() {
    repository = RegisterWithEmailRepositoryMock();
    sut = RegisterWithEmailUsecaseImpl(repository);
  });

  setUp(() {
    registerFallbackValue(const RegisterWithEmailDTO());
  });

  group('RegisterWithEmail Usecase | ', () {
    test('should return a RegisterWithEmailEntity when repository has success', () async {
      when(() => repository.registerWithEmail(any())).thenAnswer((_) async => Right(UserEntity()));

      final result = await sut(const RegisterWithEmailDTO());

      expect(result.fold(id, id), isA<UserEntity>());
    });

    test('should return a DomainException when repository fails', () async {
      when(() => repository.registerWithEmail(any())).thenAnswer(
        (_) async => Left(DomainException(message: 'error', stackTrace: StackTrace.current)),
      );

      final result = await sut(const RegisterWithEmailDTO());

      expect(result.fold(id, id), isA<DomainException>());
    });
  });
}
