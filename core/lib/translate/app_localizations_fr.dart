


import 'app_localizations.dart';

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get authSubtitle => 'Veuillez entrer les détails ci-dessous pour continuer';

  @override
  String get loginPageTitle => 'Connexion';

  @override
  String get loginButtonTitle => 'Connexion';

  @override
  String get loginToSignUp => 'Vous n\'avez pas de compte ?';

  @override
  String get loginCreateAccount => 'Créer un compte';

  @override
  String get registerPageTitle => 'S\'inscrire.';

  @override
  String get registerButtonTitle => 'S\'inscrire';

  @override
  String get registerToLogin => 'Vous avez déjà un compte ?';

  @override
  String get nameField => 'Nom complet';

  @override
  String get emailField => 'E-mail';

  @override
  String get passwordField => 'Mot de passe Mot de passe';

  @override
  String get confirmPasswordField => 'Confirmer le mot de passe';

  @override
  String get taskNameField => 'Nom de la tâche';

  @override
  String get taskNameLabel => 'Le nom de votre tâche';

  @override
  String get taskDayLabel => 'Sélectionnez le jour de votre tâche';

  @override
  String get taskTimeLabel => 'Sélectionnez l\'heure de votre tâche';

  @override
  String get createTask => 'Ajouter une tâche';

  @override
  String get editTask => 'Éditer une tâche';

  @override
  String get addTaskTitle => 'Ajoutez votre tâche';

  @override
  String get addTaskSubtitle => 'Ayez les tâches de votre journée dans la paume de votre main';

  @override
  String get errorStatusChange => 'Il n\'est pas possible de changer la tâche car elle a déjà expiré. Modifiez la tâche pour changer le statut.';

  @override
  String get errorLogoutWithoutInterner => 'Vous ne pouvez pas vous déconnecter car vous êtes hors ligne ! Veuillez vous connecter à l\'Internet.';

  @override
  String get errorSync => 'Vous ne pouvez pas vous déconnecter car vous êtes en cours de synchronisation, veuillez attendre que la synchronisation soit terminée !';

  @override
  String get notificationBody => 'Votre tâche expirera dans 30 minutes !';

  @override
  String get notificationSecondBody => 'Le temps de votre tâche vient d\'expirer!';

  @override
  String get homePageTitle => 'Bonjour ';

  @override
  String get tasks => 'Tâches';

  @override
  String get completed => 'Terminé';

  @override
  String get searchTask => 'Recherchez votre tâche';

  @override
  String get selectTime => 'Sélectionnez l\'heure';

  @override
  String get selectDay => 'Sélectionnez le jour';

  @override
  String get validateTime => 'Vous devez sélectionner l\'heure!';

  @override
  String get validateDate => 'Vous devez selectionner la date !';

  @override
  String get errorConnection => 'Pas de connexion Internet';

  @override
  String get notificationTitle => 'N\'oubliez pas de terminer la tâche';

  @override
  String get noItensFound => 'Aucun élément trouvé';

  @override
  String get offline => 'Vous êtes hors ligne';

  @override
  String get online => 'Vous êtes en ligne';

  @override
  String get sincyng => 'Synchronisation...';

  @override
  String get sync => 'Synchronisé';

  @override
  String get confirmPasswordError => 'Le mot de passe de confirmation ne correspond pas';

  @override
  String get emailError => 'E-mail invalide';

  @override
  String get nameError => 'Nom non valide';

  @override
  String get passwordError => 'Mot de passe non valide';

  @override
  String get taskError => 'Tâche non valide';
}
