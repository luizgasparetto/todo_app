import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../../domain/dtos/register_with_email_dto.dart';
import '../../domain/repositories/i_register_with_email_repository.dart';
import '../datasources/i_register_with_email_datasource.dart';

class RegisterWithEmailRepositoryImpl implements IRegisterWithEmailRepository {
  RegisterWithEmailRepositoryImpl(this._registerWithEmailDatasource);

  final IRegisterWithEmailDatasource _registerWithEmailDatasource;

  @override
  Future<Either<IAppException, UserEntity>> registerWithEmail(RegisterWithEmailDTO params) async {
    try {
      final result = await _registerWithEmailDatasource.registerWithEmail(params);

      return Right(result);
    } on IAppException catch (e) {
      return Left(e);
    }
  }
}
