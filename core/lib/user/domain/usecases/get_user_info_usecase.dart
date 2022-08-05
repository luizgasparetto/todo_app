import 'package:core/core.dart';

import '../repositories/i_get_user_info_repository.dart';
import 'package:dartz/dartz.dart';

abstract class IGetUserInfoUsecase {
  Future<Either<IAppException, UserEntity>> call();
}

class GetUserInfoUsecaseImpl implements IGetUserInfoUsecase {
  GetUserInfoUsecaseImpl(this._getUserInfoRepository);

  final IGetUserInfoRepository _getUserInfoRepository;

  @override
  Future<Either<IAppException, UserEntity>> call() async {
    return _getUserInfoRepository.getUserInfo();
  }
}
