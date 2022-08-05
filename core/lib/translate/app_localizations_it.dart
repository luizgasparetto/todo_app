


import 'app_localizations.dart';

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get authSubtitle => 'Inserisci i dati qui sotto per continuare';

  @override
  String get loginPageTitle => 'Accedi.';

  @override
  String get loginButtonTitle => 'Accedi';

  @override
  String get loginToSignUp => 'Non hai un account?';

  @override
  String get loginCreateAccount => 'Crea un account';

  @override
  String get registerPageTitle => 'Iscriviti.';

  @override
  String get registerButtonTitle => 'Iscriviti';

  @override
  String get registerToLogin => 'Hai già un account?';

  @override
  String get nameField => 'Nome completo';

  @override
  String get emailField => 'Indirizzo e-mail';

  @override
  String get passwordField => 'Password di accesso';

  @override
  String get confirmPasswordField => 'Conferma la password';

  @override
  String get taskNameField => 'Nome dell\'attività';

  @override
  String get taskNameLabel => 'Nome dell\'attività';

  @override
  String get taskDayLabel => 'Selezionare il giorno dell\'attività';

  @override
  String get taskTimeLabel => 'Selezionare l\'ora dell\'attività';

  @override
  String get createTask => 'Aggiungi attività';

  @override
  String get editTask => 'Modifica attività';

  @override
  String get addTaskTitle => 'Aggiungi il tuo compito';

  @override
  String get addTaskSubtitle => 'Avere le attività della giornata nel palmo della mano';

  @override
  String get errorStatusChange => 'Non è possibile modificare lo stato dell\'attività perché è già scaduta. Modificare l\'attività per cambiarne lo stato.';

  @override
  String get errorLogoutWithoutInterner => 'Non è possibile effettuare il logout perché si è offline! Connettetevi a Internet.';

  @override
  String get errorSync => 'Non è possibile effettuare il logout perché si sta sincronizzando, attendere il completamento della sincronizzazione!';

  @override
  String get notificationBody => 'L\'attività scadrà tra 30 minuti!';

  @override
  String get notificationSecondBody => 'Il tempo dell\'attività è appena scaduto!';

  @override
  String get homePageTitle => 'Ciao ';

  @override
  String get tasks => 'Attività';

  @override
  String get completed => 'Completato';

  @override
  String get searchTask => 'Cerca il tuo compito';

  @override
  String get selectTime => 'Selezionare l\'ora';

  @override
  String get selectDay => 'Selezionare il giorno';

  @override
  String get validateTime => 'È necessario selezionare l\'ora!';

  @override
  String get validateDate => 'Devi selezionare la data!';

  @override
  String get errorConnection => 'Nessuna connessione a Internet';

  @override
  String get notificationTitle => 'Non dimenticare di completare il compito';

  @override
  String get noItensFound => 'Nessun itens trovato';

  @override
  String get offline => 'Sei offline';

  @override
  String get online => 'Sei online';

  @override
  String get sincyng => 'Sincronizzazione...';

  @override
  String get sync => 'Sincronizzato';

  @override
  String get confirmPasswordError => 'La password di conferma non corrisponde';

  @override
  String get emailError => 'E-mail non valida';

  @override
  String get nameError => 'Nome non valido';

  @override
  String get passwordError => 'Password non valida';

  @override
  String get taskError => 'Attività non valida';
}
