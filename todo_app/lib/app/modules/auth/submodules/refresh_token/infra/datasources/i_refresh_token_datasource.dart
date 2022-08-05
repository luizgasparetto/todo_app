import '../../domain/dtos/refresh_token_dto.dart';
import '../../domain/entities/refresh_token_entity.dart';

abstract class IRefreshTokenDatasource {
  Future<RefreshTokenEntity> getRefreshToken(RefreshTokenDTO params);
}
