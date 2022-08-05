import 'package:dependency_module/dependency_module.dart';

import 'domain/usecases/get_refresh_token_usecase.dart';
import 'external/datasources/refresh_token_datasource_impl.dart';
import 'infra/repositories/refresh_token_repository_impl.dart';

class RefreshTokenModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => RefreshTokenDatasourceImpl(i()), export: true),
        Bind.factory((i) => RefreshTokenRepositoryImpl(i()), export: true),
        Bind.factory((i) => GetRefreshTokenUsecaseImpl(i()), export: true),
      ];
}
