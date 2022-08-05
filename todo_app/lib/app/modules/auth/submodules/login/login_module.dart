import 'package:dependency_module/dependency_module.dart';

import 'domain/usecases/login_with_email_usecase.dart';
import 'external/datasources/login_with_email_datasource_impl.dart';
import 'infra/repositories/login_with_email_repository_impl.dart';
import 'presenter/controllers/login_controller.dart';
import 'presenter/ui/login_page.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => LoginWithEmailDatasourceImpl(i())),
        Bind.factory((i) => LoginRepositoryImpl(i())),
        Bind.factory((i) => LoginUsecaseImpl(i())),
        Bind.singleton((i) => LoginController(i(), i(), i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, __) => LoginPage(
            controller: context.read<LoginController>(),
          ),
        ),
      ];
}
