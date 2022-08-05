import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_do_app/app/modules/auth/submodules/refresh_token/domain/dtos/refresh_token_dto.dart';
import 'package:todo_do_app/app/modules/auth/submodules/refresh_token/domain/entities/refresh_token_entity.dart';
import 'package:todo_do_app/app/modules/auth/submodules/refresh_token/domain/repositories/i_refresh_token_repository.dart';
import 'package:todo_do_app/app/modules/auth/submodules/refresh_token/domain/usecases/get_refresh_token_usecase.dart';

class RefreshTokenRepositoryMock extends Mock implements IRefreshTokenRepository {}

void main() {
  late final IRefreshTokenRepository repository;
  late final IGetRefreshTokenUsecase sut;

  setUpAll(() {
    repository = RefreshTokenRepositoryMock();
    sut = GetRefreshTokenUsecaseImpl(repository);
  });

  setUp(() {
    registerFallbackValue(const RefreshTokenDTO());
  });

  group('GetRefreshToken Usecase | ', () {
    test('should return a RefreshTokenEntity when repository has success', () async {
      when(() => repository.getRefreshToken(any())).thenAnswer(
        (_) async => const Right(RefreshTokenEntity()),
      );

      final result = await sut(const RefreshTokenDTO());

      expect(result.fold(id, id), isA<RefreshTokenEntity>());
    });

    test('should return a DomainError when repository fails', () async {
      when(() => repository.getRefreshToken(any())).thenAnswer(
        (_) async => Left(DomainException(message: 'error', stackTrace: StackTrace.current)),
      );

      final result = await sut(const RefreshTokenDTO());

      expect(result.fold(id, id), isA<DomainException>());
    });
  });
}
