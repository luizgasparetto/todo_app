import 'dart:convert';

import 'package:core/core.dart';

import '../../domain/dtos/refresh_token_dto.dart';
import '../../domain/entities/refresh_token_entity.dart';
import '../../infra/datasources/i_refresh_token_datasource.dart';
import '../mappers/refresh_token_mapper.dart';

class RefreshTokenDatasourceImpl implements IRefreshTokenDatasource {
  const RefreshTokenDatasourceImpl(this._clientService);

  final IClientService _clientService;

  @override
  Future<RefreshTokenEntity> getRefreshToken(RefreshTokenDTO params) async {
    try {
      final result = await _clientService.get(
        AppApiConstants.refreshTokenEndPoint(params.refreshToken),
      );

      return RefreshTokenEntityMapper.fromMap(
        (result.data is String ? jsonDecode(result.data as String) : result.data) as Map<String, dynamic>,
      );
    } on IAppException {
      rethrow;
    } catch (e, s) {
      throw DatasourceException(message: e.toString(), stackTrace: s);
    }
  }
}
