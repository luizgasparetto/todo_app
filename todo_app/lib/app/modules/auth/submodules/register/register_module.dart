import 'package:dependency_module/dependency_module.dart';

import 'domain/usecases/register_with_email_usecase.dart';
import 'external/datasources/register_with_email_datasource_impl.dart';
import 'infra/repositories/register_with_email_repository_impl.dart';
import 'presenter/controllers/register_controller.dart';
import 'presenter/ui/register_page.dart';

class RegisterModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => RegisterWithEmailDatasourceImpl(i())),
        Bind.factory((i) => RegisterWithEmailRepositoryImpl(i())),
        Bind.factory((i) => RegisterWithEmailUsecaseImpl(i())),
        Bind.singleton((i) => RegisterController(i(),i(),i(),i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, __) => RegisterPage(
            controller: context.read<RegisterController>(),
          ),
        ),
      ];
}
