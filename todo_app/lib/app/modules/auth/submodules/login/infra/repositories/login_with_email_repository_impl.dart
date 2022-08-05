import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../../domain/dtos/login_with_email_dto.dart';
import '../../domain/repositories/login_with_email_repository.dart';
import '../datasources/i_login_with_email_datasource.dart';

class LoginRepositoryImpl implements ILoginRepository {
  const LoginRepositoryImpl(this._loginWithEmailDatasource);

  final ILoginDatasource _loginWithEmailDatasource;

  @override
  Future<Either<IAppException, UserEntity>> loginWithEmail(
      LoginWithEmailDTO params) async {
    try {
      final result = await _loginWithEmailDatasource.loginWithEmail(params);

      return Right(result);
    } on IAppException catch (e) {
      return Left(e);
    }
  }
}
