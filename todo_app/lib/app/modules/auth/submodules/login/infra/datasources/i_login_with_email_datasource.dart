import 'package:core/user/domain/entities/user_entity.dart';

import '../../domain/dtos/login_with_email_dto.dart';

abstract class ILoginDatasource {
  Future<UserEntity> loginWithEmail(LoginWithEmailDTO params);
}
