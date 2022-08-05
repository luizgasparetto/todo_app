
import 'package:core/translate/app_localizations.dart';

class LoginWithEmailDTO {
  const LoginWithEmailDTO({
    this.email = '',
    this.password = '',
    this.localizations,
  });
  final String email;
  final String password;
  final AppLocalizations? localizations;
}
