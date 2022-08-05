


import 'app_localizations.dart';

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get authSubtitle => 'الرجاء إدخال التفاصيل أدناه للمتابعة';

  @override
  String get loginPageTitle => 'تسجيل الدخول.';

  @override
  String get loginButtonTitle => 'تسجيل الدخول';

  @override
  String get loginToSignUp => 'ليس لديك حساب؟';

  @override
  String get loginCreateAccount => 'إصنع حساب';

  @override
  String get registerPageTitle => 'اشتراك.';

  @override
  String get registerButtonTitle => 'اشتراك';

  @override
  String get registerToLogin => 'هل لديك حساب؟';

  @override
  String get nameField => 'الاسم الكامل';

  @override
  String get emailField => 'البريد الإلكتروني';

  @override
  String get passwordField => 'كلمة المرور';

  @override
  String get confirmPasswordField => 'تأكيد كلمة المرور';

  @override
  String get taskNameField => 'اسم المهمة';

  @override
  String get taskNameLabel => 'اسم مهمتك';

  @override
  String get taskDayLabel => 'حدد يوم مهمتك';

  @override
  String get taskTimeLabel => 'حدد ساعة مهمتك';

  @override
  String get createTask => 'إضافة مهمة';

  @override
  String get editTask => 'تحرير المهمة';

  @override
  String get addTaskTitle => 'أضف مهمتك';

  @override
  String get addTaskSubtitle => 'اجعل مهام يومك في متناول يدك';

  @override
  String get errorStatusChange => 'قم بتحرير المهمة لتغيير الحالة.لا يمكن تغيير حالة المهمة لأنها انتهت بالفعل.';

  @override
  String get errorLogoutWithoutInterner => 'لا يمكنك تسجيل الخروج لأنك غير متصل! الرجاء الاتصال بالإنترنت.';

  @override
  String get errorSync => 'لا يمكنك الخروج لأنك تقوم بالمزامنة ، انتظر حتى تنتهي المزامنة!';

  @override
  String get notificationBody => 'ستنتهي مهمتك في 30 دقيقة!';

  @override
  String get notificationSecondBody => 'انتهى وقت مهمتك للتو!';

  @override
  String get homePageTitle => 'مرحبًا ';

  @override
  String get tasks => 'مهام';

  @override
  String get completed => 'مكتمل';

  @override
  String get searchTask => 'ابحث في مهمتك';

  @override
  String get selectTime => 'حدد الوقت';

  @override
  String get selectDay => 'حدد الوقت';

  @override
  String get validateTime => 'تحتاج إلى تحديد الوقت!';

  @override
  String get validateDate => 'تحتاج إلى تحديد التاريخ!';

  @override
  String get errorConnection => 'لا يوجد اتصال بالإنترنت';

  @override
  String get notificationTitle => 'لا تنسى إكمال المهمة';

  @override
  String get noItensFound => 'لم يتم العثور على العناصر';

  @override
  String get offline => 'لم يتم العثور على ';

  @override
  String get online => 'أنت متصل';

  @override
  String get sincyng => '...مزامنة';

  @override
  String get sync => 'متزامن';

  @override
  String get confirmPasswordError => 'تأكيد كلمة المرور غير مطابق';

  @override
  String get emailError => 'بريد إلكتروني خاطئ';

  @override
  String get nameError => 'اسم غير صحيح';

  @override
  String get passwordError => 'رمز مرور خاطئ';

  @override
  String get taskError => 'مهمة غير صحيحة';
}
