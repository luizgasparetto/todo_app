import 'package:core/user/domain/entities/user_entity.dart';

import '../../domain/dtos/register_with_email_dto.dart';

abstract class IRegisterWithEmailDatasource {
  Future<UserEntity> registerWithEmail(RegisterWithEmailDTO params);
}
