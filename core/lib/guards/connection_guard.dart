import 'dart:async';

import 'package:core/core.dart';
import 'package:dependency_module/dependency_module.dart';

class ConnectionGuard extends RouteGuard {
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    await Modular.get<IConnectionService>().getConnectionStatus();

    return true;
  }
}
