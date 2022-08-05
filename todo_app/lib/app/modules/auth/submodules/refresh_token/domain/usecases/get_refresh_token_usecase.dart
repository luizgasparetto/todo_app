import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../dtos/refresh_token_dto.dart';
import '../entities/refresh_token_entity.dart';
import '../repositories/i_refresh_token_repository.dart';

abstract class IGetRefreshTokenUsecase {
  Future<Either<IAppException, RefreshTokenEntity>> call(RefreshTokenDTO params);
}

class GetRefreshTokenUsecaseImpl implements IGetRefreshTokenUsecase {
  const GetRefreshTokenUsecaseImpl(this._refreshTokenRepository);

  final IRefreshTokenRepository _refreshTokenRepository;

  @override
  Future<Either<IAppException, RefreshTokenEntity>> call(RefreshTokenDTO params) async {
    return _refreshTokenRepository.getRefreshToken(params);
  }
}
