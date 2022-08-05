import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../dtos/login_with_email_dto.dart';
import '../repositories/login_with_email_repository.dart';

abstract class ILoginUsecase {
  Future<Either<IAppException, UserEntity>> call(LoginWithEmailDTO params);
}

class LoginUsecaseImpl implements ILoginUsecase {
  LoginUsecaseImpl(this._loginWithEmailRepository);

  final ILoginRepository _loginWithEmailRepository;

  @override
  Future<Either<IAppException, UserEntity>> call(LoginWithEmailDTO params) async {
    return _loginWithEmailRepository.loginWithEmail(params);
  }
}
