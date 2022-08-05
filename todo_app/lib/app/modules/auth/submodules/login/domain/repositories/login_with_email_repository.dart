import 'package:core/shared/failures/i_app_exception.dart';
import 'package:core/user/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../dtos/login_with_email_dto.dart';

abstract class ILoginRepository {
  Future<Either<IAppException, UserEntity>> loginWithEmail(
      LoginWithEmailDTO params);
}
