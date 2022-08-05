import 'package:core/core.dart';
import 'package:core/translate/app_localizations.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/dtos/register_with_email_dto.dart';
import '../../domain/usecases/register_with_email_usecase.dart';

class RegisterController {
  RegisterController(
    this._registerWithEmailUsecase,
    this._overlayService,
    this.authStore,
    this._connectionService,
  );

  final IRegisterWithEmailUsecase _registerWithEmailUsecase;
  final IOverlayService _overlayService;
  final AuthStore authStore;
  final IConnectionService _connectionService;

  Future<void> registerWithEmail(AppLocalizations localizations) async {
    if (formKey.currentState!.validate()) {
      if (_connectionService.isOnline) {
        final registerWithEmailDTO = RegisterWithEmailDTO(
          email: emailInstance.value!,
          password: passwordInstance.value!,
          name: nameInstance.value!,
          localizations: localizations,
        );
        authStore.setLoadingValue(value: true);
        final result = await _registerWithEmailUsecase(registerWithEmailDTO);
        result.fold((l) {
          authStore.setLoadingValue(value: false);
          _overlayService.showErrorSnackBar(l.message);
        }, (r) {
          authStore.authentication(r);
        });
      } else {
        _overlayService.showErrorSnackBar(localizations.errorConnection);
      }
    }
  }

  final formKey = GlobalKey<FormState>();

  final nameInstance = Name();
  String? get name => nameInstance.value;
  set name(String? value) => nameInstance.value = value;

  final emailInstance = Email();
  String? get email => emailInstance.value;
  set email(String? value) => emailInstance.value = value;

  final passwordInstance = Password();
  String? get password => passwordInstance.value;
  set password(String? value) {
    passwordInstance.value = value;
    confirmPasswordInstance.password = value;
  }

  final confirmPasswordInstance = ConfirmPassword();
  String? get confirmPassword => confirmPasswordInstance.confirmPassword;
  set confirmPassword(String? value) => confirmPasswordInstance.confirmPassword = value;
}
