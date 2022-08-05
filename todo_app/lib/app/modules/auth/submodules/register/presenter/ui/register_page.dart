import 'package:core/core.dart';
import 'package:core/translate/app_localizations.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import 'package:tads_design_system/tads_design_system.dart';

import '../controllers/register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, required this.controller}) : super(key: key);

  final RegisterController controller;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: TADSCustomInitPage(
        verticalPadding: 50,
        child: Column(
          crossAxisAlignment: kIsWeb ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            TADSCustomTitlePainel(
              title: AppLocalizations.of(context)!.registerPageTitle,
              subtitle: AppLocalizations.of(context)!.authSubtitle,
            ),
            SizedBox(height: size.height * 0.12),
            Form(
              key: widget.controller.formKey,
              child: Column(
                children: [
                  TADSCustomTextField(
                    label: AppLocalizations.of(context)!.nameField,
                    prefixIcon: IconlyLight.profile,
                    onChanged: (value) => widget.controller.name = value,
                    validate: (_) => widget.controller.nameInstance.hasError(AppLocalizations.of(context)!.nameError),
                  ),
                  TADSCustomTextField(
                    label: AppLocalizations.of(context)!.emailField,
                    prefixIcon: IconlyLight.message,
                    onChanged: (value) => widget.controller.email = value,
                    validate: (_) => widget.controller.emailInstance.hasError(AppLocalizations.of(context)!.emailError),
                  ),
                  TADSCustomTextField(
                    label: AppLocalizations.of(context)!.passwordField,
                    prefixIcon: IconlyLight.lock,
                    onChanged: (value) => widget.controller.password = value,
                    validate: (_) =>
                        widget.controller.passwordInstance.hasError(AppLocalizations.of(context)!.passwordError),
                    isPassword: true,
                  ),
                  TADSCustomTextField(
                    label: AppLocalizations.of(context)!.confirmPasswordField,
                    prefixIcon: IconlyLight.lock,
                    onChanged: (value) => widget.controller.confirmPassword = value,
                    validate: (_) => widget.controller.confirmPasswordInstance.hasError(
                      AppLocalizations.of(context)!.confirmPasswordError,
                    ),
                    isPassword: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.12),
            TripleBuilder<AuthStore, IAppException, AuthState>(
              store: widget.controller.authStore,
              builder: (context, state) {
                return TADSCustomButton(
                  text: AppLocalizations.of(context)!.registerButtonTitle,
                  isLoading: state.isLoading,
                  width: 300,
                  onPressed: () async {
                    if (!state.isLoading) {
                      await widget.controller.registerWithEmail(AppLocalizations.of(context)!);
                    }
                  },
                );
              },
            ),
            SizedBox(height: size.height * 0.02),
            TADSCustomButtonWithPhrase(
              phrase: AppLocalizations.of(context)!.registerToLogin,
              buttonTitle: AppLocalizations.of(context)!.loginButtonTitle,
              onPressed: () => Modular.to.pushReplacementNamed(AppRoutes.toLogin),
            ),
          ],
        ),
      ),
    );
  }
}
