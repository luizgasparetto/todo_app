import 'package:core/user/domain/entities/user_entity.dart';

abstract class IGetUserInfoDatasource {
  Future<UserEntity> getUserInfo();
}
