import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../../domain/dtos/refresh_token_dto.dart';
import '../../domain/entities/refresh_token_entity.dart';
import '../../domain/repositories/i_refresh_token_repository.dart';
import '../datasources/i_refresh_token_datasource.dart';

class RefreshTokenRepositoryImpl implements IRefreshTokenRepository {
  const RefreshTokenRepositoryImpl(this._refreshTokenDatasource);

  final IRefreshTokenDatasource _refreshTokenDatasource;

  @override
  Future<Either<IAppException, RefreshTokenEntity>> getRefreshToken(RefreshTokenDTO params) async {
    try {
      final result = await _refreshTokenDatasource.getRefreshToken(params);

      return Right(result);
    } on IAppException catch (e) {
      return Left(e);
    }
  }
}
