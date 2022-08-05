


import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get authSubtitle => 'Please enter the details below to continue';

  @override
  String get loginPageTitle => 'Sign in.';

  @override
  String get loginButtonTitle => 'Sign in';

  @override
  String get loginToSignUp => 'Don\'t have an account?';

  @override
  String get loginCreateAccount => 'Create Account';

  @override
  String get registerPageTitle => 'Sign up.';

  @override
  String get registerButtonTitle => 'Sign Up';

  @override
  String get registerToLogin => 'Already have an account?';

  @override
  String get nameField => 'Full Name';

  @override
  String get emailField => 'E-mail';

  @override
  String get passwordField => 'Password';

  @override
  String get confirmPasswordField => 'Confirm Password';

  @override
  String get taskNameField => 'Task Name';

  @override
  String get taskNameLabel => 'Your task\'s name';

  @override
  String get taskDayLabel => 'Select your task\'s day';

  @override
  String get taskTimeLabel => 'Select your task\'s hour';

  @override
  String get createTask => 'Add task';

  @override
  String get editTask => 'Edit task';

  @override
  String get addTaskTitle => 'Add your task';

  @override
  String get addTaskSubtitle => 'Have your day\'s tasks in the palm of your hand';

  @override
  String get errorStatusChange => 'It\' is not possible to change the status of the task because it has already expired. Edit the task to change the status.';

  @override
  String get errorLogoutWithoutInterner => 'You cannot log out as you are offline! Please connect to the internet.';

  @override
  String get errorSync => 'You can\'t logout because you are syncing, wait for the sync to finish!';

  @override
  String get notificationBody => 'Your task will expire in 30 minutes!';

  @override
  String get notificationSecondBody => 'The time of your task has just expired!';

  @override
  String get homePageTitle => 'Hello ';

  @override
  String get tasks => 'Tasks';

  @override
  String get completed => 'Completed';

  @override
  String get searchTask => 'Search your task';

  @override
  String get selectTime => 'Select time';

  @override
  String get selectDay => 'Select day';

  @override
  String get validateTime => 'You need to select time!';

  @override
  String get validateDate => 'You need to select date!';

  @override
  String get errorConnection => 'No internet connection';

  @override
  String get notificationTitle => 'Don\'t forget to complete task';

  @override
  String get noItensFound => 'No itens found';

  @override
  String get offline => 'You are offline';

  @override
  String get online => 'You are online';

  @override
  String get sincyng => 'Syncing...';

  @override
  String get sync => 'Synced';

  @override
  String get confirmPasswordError => 'Confirm password doesn\'t match';

  @override
  String get emailError => 'Invalid e-mail';

  @override
  String get nameError => 'Invalid name';

  @override
  String get passwordError => 'Invalid password';

  @override
  String get taskError => 'Invalid task';
}
