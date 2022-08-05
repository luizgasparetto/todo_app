import '../../domain/entities/refresh_token_entity.dart';
import '../errors/datasource_errors.dart';

class RefreshTokenEntityMapper {
  static RefreshTokenEntity fromMap(Map<String, dynamic> json) {
    try {
      return RefreshTokenEntity(
        token: json['token'] as String,
        refreshToken: json['refreshToken'] as String,
        tokenType: json['tokenType'] as String,
      );
    } catch (e, s) {
      throw RefreshTokenMapperException(message: e.toString(), stackTrace: s);
    }
  }
}
