import 'dart:async';
import 'package:core/core.dart';
import 'package:dependency_module/dependency_module.dart';

class AuthGuard extends RouteGuard {
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    bool? isAuthenticated;

    if (path == AppRoutes.toLogin) return true;

    final getUserInfoUsecase = Modular.get<IGetUserInfoUsecase>();

    final result = await getUserInfoUsecase();

    result.fold(
      (l) => isAuthenticated = false,
      (user) => isAuthenticated = true,
    );

    return isAuthenticated ?? false;
  }

  @override
  String? get redirectTo => AppRoutes.toLogin;
}
