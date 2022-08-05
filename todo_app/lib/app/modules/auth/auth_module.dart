import 'package:dependency_module/dependency_module.dart';

import 'submodules/login/login_module.dart';
import 'submodules/refresh_token/refresh_token_module.dart';
import 'submodules/register/register_module.dart';

class AuthModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/login', module: LoginModule()),
        ModuleRoute('/register', module: RegisterModule()),
        ModuleRoute('/refresh-token', module: RefreshTokenModule()),
      ];
}
