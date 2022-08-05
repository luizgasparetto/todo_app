import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../dtos/register_with_email_dto.dart';

abstract class IRegisterWithEmailRepository {
  Future<Either<IAppException, UserEntity>> registerWithEmail(RegisterWithEmailDTO params);
}
