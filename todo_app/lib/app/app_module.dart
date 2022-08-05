import 'package:core/core.dart';
import 'package:dependency_module/dependency_module.dart';

import 'modules/auth/auth_module.dart';
import 'modules/home/home_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule(), UserModule()];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: SplashModule(), guards: [ConnectionGuard()]),
        ModuleRoute('/auth', module: AuthModule(), guards: [ConnectionGuard()]),
        ModuleRoute('/home', module: HomeModule(), guards: [ConnectionGuard(), AuthGuard()]),
      ];
}
