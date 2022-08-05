


import 'app_localizations.dart';

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get authSubtitle => 'जारी रखने के लिए कृपया नीचे विवरण दर्ज करें';

  @override
  String get loginPageTitle => 'साइन इन करें।';

  @override
  String get loginButtonTitle => 'साइन इन करें';

  @override
  String get loginToSignUp => 'क्या आपके पास खाता नहीं है?';

  @override
  String get loginCreateAccount => 'खाता बनाएँ';

  @override
  String get registerPageTitle => 'साइन अप करें।';

  @override
  String get registerButtonTitle => 'साइन अप';

  @override
  String get registerToLogin => 'आपके पास पहले से ही एक खाता है?';

  @override
  String get nameField => 'पूरा नाम';

  @override
  String get emailField => 'ई-मेल';

  @override
  String get passwordField => 'पासवर्ड';

  @override
  String get confirmPasswordField => 'पासवर्ड की पुष्टि करें';

  @override
  String get taskNameField => 'टास्क नेम';

  @override
  String get taskNameLabel => 'आपके कार्य का नाम';

  @override
  String get taskDayLabel => 'अपने कार्य का दिन चुनें';

  @override
  String get taskTimeLabel => 'अपने कार्य का समय चुनें';

  @override
  String get createTask => 'टास्क जोड़ें';

  @override
  String get editTask => 'कार्य संपादित करें';

  @override
  String get addTaskTitle => 'अपना कार्य जोड़ें';

  @override
  String get addTaskSubtitle => 'अपने दिन के कार्यों को अपने हाथ की हथेली में रखें';

  @override
  String get errorStatusChange => 'कार्य की स्थिति को बदलना संभव नहीं है क्योंकि यह पहले ही समाप्त हो चुका है। स्थिति बदलने के लिए कार्य संपादित करें।';

  @override
  String get errorLogoutWithoutInterner => 'आप ऑफ़लाइन होने के कारण लॉग आउट नहीं कर सकते! कृपया इंटरनेट से कनेक्ट करें।';

  @override
  String get errorSync => 'आप लॉगआउट नहीं कर सकते क्योंकि आप सिंक कर रहे हैं, सिंक के समाप्त होने की प्रतीक्षा करें!';

  @override
  String get notificationBody => 'आपका कार्य 30 मिनट में समाप्त हो जाएगा!';

  @override
  String get notificationSecondBody => 'आपके कार्य का समय अभी समाप्त हुआ है!';

  @override
  String get homePageTitle => 'हैलो ';

  @override
  String get tasks => 'कार्य';

  @override
  String get completed => 'पूर्ण';

  @override
  String get searchTask => 'अपना कार्य खोजें';

  @override
  String get selectTime => 'समय चुनें';

  @override
  String get selectDay => 'सेलेक्ट डे';

  @override
  String get validateTime => 'आपको समय चुनने की आवश्यकता है!';

  @override
  String get validateDate => 'आपको तारीख चुननी है!';

  @override
  String get errorConnection => 'कोई इंटरनेट कनेक्शन नहीं';

  @override
  String get notificationTitle => 'कार्य पूरा करना न भूलें';

  @override
  String get noItensFound => 'कोई इटेन्स नहीं मिला';

  @override
  String get offline => 'आप ऑफ़लाइन हैं';

  @override
  String get online => 'आप ऑनलाइन हैं';

  @override
  String get sincyng => 'सिंक हो रहा है...';

  @override
  String get sync => 'सिंक किया गया';

  @override
  String get confirmPasswordError => 'पुष्टि करें कि पासवर्ड मेल नहीं खाता';

  @override
  String get emailError => 'अमान्य ई-मेल';

  @override
  String get nameError => 'अमान्य नाम';

  @override
  String get passwordError => 'अमान्य पासवर्ड';

  @override
  String get taskError => 'अमान्य कार्य';
}
