import 'package:core/core.dart';
import 'package:core/translate/app_localizations.dart';

import '../../domain/dtos/login_with_email_dto.dart';
import '../../domain/usecases/login_with_email_usecase.dart';

class LoginController {
  LoginController(
    this._loginWithEmailUsecase,
    this._overlayService,
    this.authStore,
    this._connectionService,
  );

  final ILoginUsecase _loginWithEmailUsecase;
  final IOverlayService _overlayService;
  final AuthStore authStore;
  final IConnectionService _connectionService;

  Future<void> loginWithEmail(AppLocalizations localizations) async {
    if (_connectionService.isOnline) {
      final loginWithEmailDTO = LoginWithEmailDTO(
        email: emailInstance.value!,
        password: passwordInstance.value!,
        localizations: localizations,
      );

      authStore.setLoadingValue(value: true);

      final result = await _loginWithEmailUsecase(loginWithEmailDTO);

      result.fold((l) {
        authStore.setLoadingValue(value: false);
        _overlayService.showErrorSnackBar(l.message);
      }, (r) async {
        authStore.authentication(r);
      });
    } else {
      _overlayService.showErrorSnackBar(localizations.errorConnection);
    }
  }

  final emailInstance = Email();
  String? get email => emailInstance.value;
  set email(String? value) => emailInstance.value = value;

  final passwordInstance = Password();
  String? get password => passwordInstance.value;
  set password(String? value) => passwordInstance.value = value;
}
