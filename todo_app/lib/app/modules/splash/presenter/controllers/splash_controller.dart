import 'package:core/core.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/foundation.dart';

import '../../../auth/submodules/refresh_token/domain/dtos/refresh_token_dto.dart';
import '../../../auth/submodules/refresh_token/domain/usecases/get_refresh_token_usecase.dart';

class SplashController {
  const SplashController(this._refreshTokenUsecase, this._getUserInfoUsecase, this.authStore, this.connectionService);

  final IGetRefreshTokenUsecase _refreshTokenUsecase;
  final IGetUserInfoUsecase _getUserInfoUsecase;
  final AuthStore authStore;
  final IConnectionService connectionService;

  Future<void> initApp() async {
    final result = await _getUserInfoUsecase();

    result.fold((l) => authStore.logout(), login);
  }

  Future<void> login(UserEntity user) async {
    !kIsWeb && !connectionService.isOnline ? _loginIfIsOffline(user) : await _loginIfIsOnlineOrIsWeb(user);
  }

  void _loginIfIsOffline(UserEntity user) => authStore.authentication(user);

  Future<void> _loginIfIsOnlineOrIsWeb(UserEntity user) async {
    if (user.token.isNotEmpty && !JwtDecoder.isExpired(user.token)) {
      authStore.authentication(user);
    } else if (user.refreshToken.isNotEmpty && JwtDecoder.isExpired(user.refreshToken)) {
      await refreshToken(user);
    } else {
      authStore.logout();
    }
  }

  Future<void> refreshToken(UserEntity user) async {
    final result = await _refreshTokenUsecase(
      RefreshTokenDTO(refreshToken: user.refreshToken),
    );

    result.fold((l) => authStore.logout(), (r) {
      authStore.authentication(user.copyWith(token: r.token, refreshToken: r.refreshToken));
    });
  }

  void redirectUser(AuthState state) {
    if (state is AuthLoggedState) {
      Modular.to.pushReplacementNamed(AppRoutes.toHome);
    } else if (state is AuthLoggedOutState) {
      Modular.to.pushReplacementNamed(AppRoutes.toLogin);
    }
  }
}
