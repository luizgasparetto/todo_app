


import 'app_localizations.dart';

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get authSubtitle => '请在下方输入详细信息以继续';

  @override
  String get loginPageTitle => '登录。';

  @override
  String get loginButtonTitle => '登录';

  @override
  String get loginToSignUp => '没有账号？';

  @override
  String get loginCreateAccount => '创建账户';

  @override
  String get registerPageTitle => '注册。';

  @override
  String get registerButtonTitle => '注册';

  @override
  String get registerToLogin => '已有账号？';

  @override
  String get nameField => '全名';

  @override
  String get emailField => '电子邮件';

  @override
  String get passwordField => '密码';

  @override
  String get confirmPasswordField => '确认密码';

  @override
  String get taskNameField => '任务名称';

  @override
  String get taskNameLabel => '你的任务名称';

  @override
  String get taskDayLabel => '选择你的任务日期';

  @override
  String get taskTimeLabel => '选择你的任务时间';

  @override
  String get createTask => '添加任务';

  @override
  String get editTask => '编辑任务';

  @override
  String get addTaskTitle => '添加你的任务';

  @override
  String get addTaskSubtitle => '一天的任务尽在掌握';

  @override
  String get errorStatusChange => '任务状态已过期，无法更改状态。编辑任务以更改状态。';

  @override
  String get errorLogoutWithoutInterner => '您离线无法注销！请连接到互联网。';

  @override
  String get errorSync => '您无法注销，因为您正在同步，请等待同步完成！';

  @override
  String get notificationBody => '你的任务将在 30 分钟后过期！';

  @override
  String get notificationSecondBody => '你的任务时间刚刚到期！';

  @override
  String get homePageTitle => '你好 ';

  @override
  String get tasks => '任务';

  @override
  String get completed => '完成';

  @override
  String get searchTask => '搜索你的任务';

  @override
  String get selectTime => '选择时间';

  @override
  String get selectDay => '选择日期';

  @override
  String get validateTime => '您需要选择时间！';

  @override
  String get validateDate => '您需要选择日期！';

  @override
  String get errorConnection => '没有网络连接';

  @override
  String get notificationTitle => '别忘了完成任务';

  @override
  String get noItensFound => '没有找到元素';

  @override
  String get offline => '你离线';

  @override
  String get online => '你在线';

  @override
  String get sincyng => '正在同步...';

  @override
  String get sync => '同步';

  @override
  String get confirmPasswordError => '确认密码不匹配';

  @override
  String get emailError => '无效的电子邮件';

  @override
  String get nameError => '名字无效';

  @override
  String get passwordError => '密码无效';

  @override
  String get taskError => '无效任务';
}
