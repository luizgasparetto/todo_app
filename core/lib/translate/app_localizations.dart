
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_zh.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('it'),
    Locale('ja'),
    Locale('pt'),
    Locale('zh')
  ];

  /// No description provided for @authSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please enter the details below to continue'**
  String get authSubtitle;

  /// No description provided for @loginPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in.'**
  String get loginPageTitle;

  /// No description provided for @loginButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get loginButtonTitle;

  /// No description provided for @loginToSignUp.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get loginToSignUp;

  /// No description provided for @loginCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get loginCreateAccount;

  /// No description provided for @registerPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign up.'**
  String get registerPageTitle;

  /// No description provided for @registerButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get registerButtonTitle;

  /// No description provided for @registerToLogin.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get registerToLogin;

  /// No description provided for @nameField.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get nameField;

  /// No description provided for @emailField.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get emailField;

  /// No description provided for @passwordField.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordField;

  /// No description provided for @confirmPasswordField.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPasswordField;

  /// No description provided for @taskNameField.
  ///
  /// In en, this message translates to:
  /// **'Task Name'**
  String get taskNameField;

  /// No description provided for @taskNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Your task\'s name'**
  String get taskNameLabel;

  /// No description provided for @taskDayLabel.
  ///
  /// In en, this message translates to:
  /// **'Select your task\'s day'**
  String get taskDayLabel;

  /// No description provided for @taskTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Select your task\'s hour'**
  String get taskTimeLabel;

  /// No description provided for @createTask.
  ///
  /// In en, this message translates to:
  /// **'Add task'**
  String get createTask;

  /// No description provided for @editTask.
  ///
  /// In en, this message translates to:
  /// **'Edit task'**
  String get editTask;

  /// No description provided for @addTaskTitle.
  ///
  /// In en, this message translates to:
  /// **'Add your task'**
  String get addTaskTitle;

  /// No description provided for @addTaskSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Have your day\'s tasks in the palm of your hand'**
  String get addTaskSubtitle;

  /// No description provided for @errorStatusChange.
  ///
  /// In en, this message translates to:
  /// **'It\' is not possible to change the status of the task because it has already expired. Edit the task to change the status.'**
  String get errorStatusChange;

  /// No description provided for @errorLogoutWithoutInterner.
  ///
  /// In en, this message translates to:
  /// **'You cannot log out as you are offline! Please connect to the internet.'**
  String get errorLogoutWithoutInterner;

  /// No description provided for @errorSync.
  ///
  /// In en, this message translates to:
  /// **'You can\'t logout because you are syncing, wait for the sync to finish!'**
  String get errorSync;

  /// No description provided for @notificationBody.
  ///
  /// In en, this message translates to:
  /// **'Your task will expire in 30 minutes!'**
  String get notificationBody;

  /// No description provided for @notificationSecondBody.
  ///
  /// In en, this message translates to:
  /// **'The time of your task has just expired!'**
  String get notificationSecondBody;

  /// No description provided for @homePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Hello '**
  String get homePageTitle;

  /// No description provided for @tasks.
  ///
  /// In en, this message translates to:
  /// **'Tasks'**
  String get tasks;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @searchTask.
  ///
  /// In en, this message translates to:
  /// **'Search your task'**
  String get searchTask;

  /// No description provided for @selectTime.
  ///
  /// In en, this message translates to:
  /// **'Select time'**
  String get selectTime;

  /// No description provided for @selectDay.
  ///
  /// In en, this message translates to:
  /// **'Select day'**
  String get selectDay;

  /// No description provided for @validateTime.
  ///
  /// In en, this message translates to:
  /// **'You need to select time!'**
  String get validateTime;

  /// No description provided for @validateDate.
  ///
  /// In en, this message translates to:
  /// **'You need to select date!'**
  String get validateDate;

  /// No description provided for @errorConnection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get errorConnection;

  /// No description provided for @notificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Don\'t forget to complete task'**
  String get notificationTitle;

  /// No description provided for @noItensFound.
  ///
  /// In en, this message translates to:
  /// **'No itens found'**
  String get noItensFound;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'You are offline'**
  String get offline;

  /// No description provided for @online.
  ///
  /// In en, this message translates to:
  /// **'You are online'**
  String get online;

  /// No description provided for @sincyng.
  ///
  /// In en, this message translates to:
  /// **'Syncing...'**
  String get sincyng;

  /// No description provided for @sync.
  ///
  /// In en, this message translates to:
  /// **'Synced'**
  String get sync;

  /// No description provided for @confirmPasswordError.
  ///
  /// In en, this message translates to:
  /// **'Confirm password doesn\'t match'**
  String get confirmPasswordError;

  /// No description provided for @emailError.
  ///
  /// In en, this message translates to:
  /// **'Invalid e-mail'**
  String get emailError;

  /// No description provided for @nameError.
  ///
  /// In en, this message translates to:
  /// **'Invalid name'**
  String get nameError;

  /// No description provided for @passwordError.
  ///
  /// In en, this message translates to:
  /// **'Invalid password'**
  String get passwordError;

  /// No description provided for @taskError.
  ///
  /// In en, this message translates to:
  /// **'Invalid task'**
  String get taskError;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'de', 'en', 'es', 'fr', 'hi', 'it', 'ja', 'pt', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
    case 'hi': return AppLocalizationsHi();
    case 'it': return AppLocalizationsIt();
    case 'ja': return AppLocalizationsJa();
    case 'pt': return AppLocalizationsPt();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
