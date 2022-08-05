import 'package:core/translate/app_localizations.dart';

class RegisterWithEmailDTO {
  const RegisterWithEmailDTO({
    this.name = '',
    this.email = '',
    this.password = '',
    this.localizations,
  });

  final String name;
  final String email;
  final String password;
  final AppLocalizations? localizations;
}
