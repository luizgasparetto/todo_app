import 'package:dependency_module/dependency_module.dart';

import 'domain/usecases/get_user_info_usecase.dart';
import 'external/datasources/get_user_info_datasource_impl.dart';
import 'infra/repositories/get_user_info_repository_impl.dart';

class UserModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => GetUserInfoUsecaseImpl(i()), export: true),
        Bind.factory((i) => GetUserInfoDatasourceImpl(i()), export: true),
        Bind.factory((i) => GetUserInfoRepositoryImpl(i()), export: true),
      ];
}
