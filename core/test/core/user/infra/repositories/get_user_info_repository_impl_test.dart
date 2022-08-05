import 'package:core/user/domain/entities/user_entity.dart';
import 'package:core/user/domain/repositories/i_get_user_info_repository.dart';
import 'package:core/user/domain/usecases/get_user_info_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetUserInfoRepositoryMock extends Mock implements IGetUserInfoRepository {
}

void main() {
  late final IGetUserInfoRepository repository;
  late final IGetUserInfoUsecase sut;

  setUpAll(() {
    repository = GetUserInfoRepositoryMock();
    sut = GetUserInfoUsecaseImpl(repository);
  });

  group('GetUserInfo Usecase | ', () {
    test('should return a GetUserInfoEntity when the json comes valid',
        () async {
      when(() => repository.getUserInfo())
          .thenAnswer((_) async => Right(UserEntity()));

      final result = await sut();

      expect(result.fold(id, id), isA<UserEntity>());
    });
  });
}
