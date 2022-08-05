import 'package:dependency_module/dependency_module.dart';

import '../auth/submodules/refresh_token/refresh_token_module.dart';
import 'presenter/controllers/splash_controller.dart';
import 'presenter/splash_page.dart';

class SplashModule extends Module {
  @override
  List<Module> get imports => [RefreshTokenModule()];

  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => SplashController(i(), i(), i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, _) => SplashPage(
            controller: context.read<SplashController>(),
          ),
        ),
      ];
}
