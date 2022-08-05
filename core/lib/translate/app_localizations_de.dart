


import 'app_localizations.dart';

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get authSubtitle => 'Bitte geben Sie die Details unten ein, um fortzufahren';

  @override
  String get loginPageTitle => 'Anmelden.';

  @override
  String get loginButtonTitle => 'Anmelden';

  @override
  String get loginToSignUp => 'Sie haben kein Konto?';

  @override
  String get loginCreateAccount => 'Konto erstellen';

  @override
  String get registerPageTitle => 'Melden Sie sich an.';

  @override
  String get registerButtonTitle => 'Anmelden';

  @override
  String get registerToLogin => 'Haben Sie bereits ein Konto?';

  @override
  String get nameField => 'Vollständiger Name';

  @override
  String get emailField => 'E-Mail';

  @override
  String get passwordField => 'Passwort';

  @override
  String get confirmPasswordField => 'Passwort bestätigen';

  @override
  String get taskNameField => 'Aufgabenname';

  @override
  String get taskNameLabel => 'Der Name Ihrer Aufgabe';

  @override
  String get taskDayLabel => 'Wählen Sie den Tag Ihrer Aufgabe';

  @override
  String get taskTimeLabel => 'Wählen Sie die Stunde Ihrer Aufgabe aus';

  @override
  String get createTask => 'Aufgabe hinzufügen';

  @override
  String get editTask => 'Aufgabe bearbeiten';

  @override
  String get addTaskTitle => 'Fügen Sie Ihre Aufgabe hinzu';

  @override
  String get addTaskSubtitle => 'Habe deine täglichen Aufgaben in deiner Hand';

  @override
  String get errorStatusChange => 'Es ist nicht möglich, den Status der Aufgabe zu ändern, da sie bereits abgelaufen ist. Bearbeiten Sie die Aufgabe, um den Status zu ändern.';

  @override
  String get errorLogoutWithoutInterner => 'Sie können sich nicht abmelden, da Sie offline sind! Bitte verbinden Sie sich mit dem Internet.';

  @override
  String get errorSync => 'Sie können sich nicht abmelden, da Sie synchronisieren, warten Sie, bis die Synchronisierung abgeschlossen ist!';

  @override
  String get notificationBody => 'Ihre Aufgabe läuft in 30 Minuten ab!';

  @override
  String get notificationSecondBody => 'Die Zeit Ihrer Aufgabe ist gerade abgelaufen!';

  @override
  String get homePageTitle => 'Hallo ';

  @override
  String get tasks => 'Aufgaben';

  @override
  String get completed => 'abgeschlossen';

  @override
  String get searchTask => 'Suche deine Aufgabe';

  @override
  String get selectTime => 'Zeit auswählen';

  @override
  String get selectDay => 'Tag auswählen';

  @override
  String get validateTime => 'Sie müssen eine Zeit auswählen!';

  @override
  String get validateDate => 'Sie müssen ein Datum auswählen!';

  @override
  String get errorConnection => 'Keine Internetverbindung';

  @override
  String get notificationTitle => 'Vergessen Sie nicht, die Aufgabe abzuschließen';

  @override
  String get noItensFound => 'Keine Itens gefunden';

  @override
  String get offline => 'Sie sind offline';

  @override
  String get online => 'Sie sind online';

  @override
  String get sincyng => 'Synchronisieren...';

  @override
  String get sync => 'Synchronisiert';

  @override
  String get confirmPasswordError => 'Passwort bestätigen stimmt nicht überein';

  @override
  String get emailError => 'Ungültige E-Mail';

  @override
  String get nameError => 'Ungültiger Name';

  @override
  String get passwordError => 'Ungültiges Passwort';

  @override
  String get taskError => 'Ungültige Aufgabe';
}
