import 'dart:convert';

import 'package:core/core.dart';
import 'package:core/user/external/mappers/user_entity_mapper.dart';

import '../../infra/datasources/i_get_user_info_datasource.dart';

class GetUserInfoDatasourceImpl implements IGetUserInfoDatasource {
  final ILocalStorageService _localStorageService;

  const GetUserInfoDatasourceImpl(this._localStorageService);

  @override
  Future<UserEntity> getUserInfo() async {
    try {
      final result = await _localStorageService.getString(const LocalDatabaseGetStringDTO(key: 'user'));

      if (result == null) return UserEntity.empty();

      final userMap = json.decode(result);

      return UserEntityMapper.fromMap(userMap);
    } on IAppException catch (error, stackTrace) {
      throw DatasourceException(message: error.message, stackTrace: stackTrace);
    }
  }
}
