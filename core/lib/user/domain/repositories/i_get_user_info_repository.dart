import 'package:core/core.dart';

import 'package:dartz/dartz.dart';

abstract class IGetUserInfoRepository {
  Future<Either<IAppException, UserEntity>> getUserInfo();
}
