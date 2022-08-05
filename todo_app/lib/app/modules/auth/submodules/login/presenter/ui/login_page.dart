import 'package:core/core.dart';
import 'package:core/translate/app_localizations.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import 'package:tads_design_system/tads_design_system.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.controller}) : super(key: key);
  final LoginController controller;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: TADSCustomInitPage(
        verticalPadding: 40,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment:
                kIsWeb ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.1),
              TADSCustomTitlePainel(
                title: AppLocalizations.of(context)!.loginPageTitle,
                subtitle: AppLocalizations.of(context)!.authSubtitle,
              ),
              SizedBox(height: size.height * 0.12),
              TADSCustomTextField(
                label: AppLocalizations.of(context)!.emailField,
                prefixIcon: IconlyLight.message,
                onChanged: (value) => widget.controller.email = value,
                validate: (_) => widget.controller.emailInstance
                    .hasError(AppLocalizations.of(context)!.emailError),
              ),
              TADSCustomTextField(
                label: AppLocalizations.of(context)!.passwordField,
                prefixIcon: IconlyLight.lock,
                onChanged: (value) => widget.controller.password = value,
                validate: (_) => widget.controller.passwordInstance
                    .hasError(AppLocalizations.of(context)!.passwordError),
                isPassword: true,
              ),
              SizedBox(height: size.height * 0.12),
              Column(
                children: [
                  TripleBuilder<AuthStore, IAppException, AuthState>(
                    store: widget.controller.authStore,
                    builder: (context, state) {
                      return TADSCustomButton(
                        text: AppLocalizations.of(context)!.loginButtonTitle,
                        isLoading: state.isLoading,
                        width: 320,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (!state.isLoading) {
                              await widget.controller.loginWithEmail(
                                AppLocalizations.of(context)!,
                              );
                            }
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              TADSCustomButtonWithPhrase(
                phrase: AppLocalizations.of(context)!.loginToSignUp,
                buttonTitle: AppLocalizations.of(context)!.loginCreateAccount,
                onPressed: () =>
                    Modular.to.pushReplacementNamed(AppRoutes.toRegister),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
