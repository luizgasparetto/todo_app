import 'dart:convert';

import 'package:core/core.dart';
import 'package:dependency_module/dependency_module.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:todo_do_app/app/modules/auth/submodules/login/external/mappers/login_mapper.dart';

class AuthStore extends StreamStore<IAppException, AuthState> {
  AuthStore(this._localStorageService, this._localNotificationService) : super(AuthInitialState());

  final ILocalStorageService _localStorageService;
  final ILocalNotificationService _localNotificationService;

  Future<void> logout() async {
    await _localStorageService.delete(const LocalDatabaseDeleteDTO(key: 'user'));
    await _localStorageService.delete(const LocalDatabaseDeleteDTO(key: 'tasks'));

    if (!kIsWeb) {
      await _localNotificationService.cancelAllNotifications();
    }

    update(AuthLoggedOutState());

    Modular.to.pushReplacementNamed(AppRoutes.toLogin);
  }

  void setLoadingValue({required bool value}) => setLoading(value);

  Future<void> authentication(UserEntity user) async {
    await _localStorageService.setString(
      LocalDatabaseSetStringDTO(key: 'user', value: jsonEncode(LoginMapper.toMap(user))),
    );

    update(AuthLoggedState(user: user));

    Modular.to.pushReplacementNamed(AppRoutes.toHome);

    setLoading(false);
  }
}
