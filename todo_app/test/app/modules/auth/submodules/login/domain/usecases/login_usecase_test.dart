import 'package:core/user/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_do_app/app/modules/auth/submodules/login/domain/dtos/login_with_email_dto.dart';
import 'package:todo_do_app/app/modules/auth/submodules/login/domain/repositories/login_with_email_repository.dart';
import 'package:todo_do_app/app/modules/auth/submodules/login/domain/usecases/login_with_email_usecase.dart';

class LoginRepositoryMock extends Mock implements ILoginRepository {}

void main() {
  late final ILoginRepository repository;
  late final ILoginUsecase sut;

  setUpAll(() {
    repository = LoginRepositoryMock();
    sut = LoginUsecaseImpl(repository);
  });

  setUp(() {
    registerFallbackValue(const LoginWithEmailDTO());
  });

  group('LoginWithEmail Usecase | ', () {
    test('should return a UserEntity when the json comes valid', () async {
      when(() => repository.loginWithEmail(any())).thenAnswer((_) async => Right(UserEntity()));

      final result = await sut(const LoginWithEmailDTO());

      expect(result.fold(id, id), isA<UserEntity>());
    });
  });
}
