import 'package:core/core.dart';
import 'package:core/user/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:core/user/domain/repositories/i_get_user_info_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetUserInfoRepositoryMock extends Mock implements IGetUserInfoRepository {}

void main() {
  late final IGetUserInfoRepository repository;
  late final IGetUserInfoUsecase sut;

  setUpAll(() {
    repository = GetUserInfoRepositoryMock();
    sut = GetUserInfoUsecaseImpl(repository);
  });

  group('Get UserInfo Usecase | ', () {
    test('should be able to return a UserEntity', () async {
      when(() => repository.getUserInfo()).thenAnswer((_) async => Right(UserEntity()));

      final result = await sut();

      expect(result.fold(id, id), isA<UserEntity>());
    });

    test('should be able to return a Exception', () async {
      when(() => repository.getUserInfo()).thenAnswer(
        (_) async => Left(UnauthorizatedException(message: 'error', stackTrace: StackTrace.current)),
      );

      final result = await sut();

      expect(result.isLeft(), equals(true));
    });
  });
}
