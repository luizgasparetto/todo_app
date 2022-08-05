import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/i_get_user_info_repository.dart';
import '../datasources/i_get_user_info_datasource.dart';

class GetUserInfoRepositoryImpl implements IGetUserInfoRepository {
  const GetUserInfoRepositoryImpl(this._getUserInfoDatasource);

  final IGetUserInfoDatasource _getUserInfoDatasource;

  @override
  Future<Either<IAppException, UserEntity>> getUserInfo() async {
    try {
      final user = await _getUserInfoDatasource.getUserInfo();

      return Right(user);
    } on IAppException catch (e) {
      return Left(e);
    }
  }
}
