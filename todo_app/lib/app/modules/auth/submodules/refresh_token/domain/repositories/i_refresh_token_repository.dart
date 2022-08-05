import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../dtos/refresh_token_dto.dart';
import '../entities/refresh_token_entity.dart';

abstract class IRefreshTokenRepository {
  Future<Either<IAppException, RefreshTokenEntity>> getRefreshToken(RefreshTokenDTO params);
}
