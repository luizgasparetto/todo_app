


import 'app_localizations.dart';

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get authSubtitle => '続行するには、以下に詳細を入力してください。';

  @override
  String get loginPageTitle => 'サインインしてください。';

  @override
  String get loginButtonTitle => 'サインイン';

  @override
  String get loginToSignUp => 'アカウントをお持ちでない方';

  @override
  String get loginCreateAccount => 'アカウント作成';

  @override
  String get registerPageTitle => 'サインアップしてください。';

  @override
  String get registerButtonTitle => 'サインアップ';

  @override
  String get registerToLogin => 'すでにアカウントをお持ちの方';

  @override
  String get nameField => '氏名（ふりがな';

  @override
  String get emailField => '電子メール';

  @override
  String get passwordField => 'パスワード';

  @override
  String get confirmPasswordField => 'パスワードの確認';

  @override
  String get taskNameField => 'タスク名';

  @override
  String get taskNameLabel => 'あなたのタスクの名前';

  @override
  String get taskDayLabel => 'タスクの曜日を選択するy';

  @override
  String get taskTimeLabel => 'タスクの時間帯を選択する';

  @override
  String get createTask => 'タスクの追加';

  @override
  String get editTask => 'タスクの編集';

  @override
  String get addTaskTitle => 'タスクを追加する';

  @override
  String get addTaskSubtitle => '一日のタスクを手のひらで確認できる';

  @override
  String get errorStatusChange => 'すでに期限切れのため、タスクのステータスを変更することはできません。タスクを編集してステータスを変更してください。';

  @override
  String get errorLogoutWithoutInterner => 'オフラインのためログアウトできません! インターネットに接続してください。';

  @override
  String get errorSync => '同期中なのでログアウトできません、同期が終わるのを待ってください';

  @override
  String get notificationBody => 'タスクの有効期限は30分です';

  @override
  String get notificationSecondBody => 'あなたのタスクの時間はちょうど終了しました!';

  @override
  String get homePageTitle => 'こんにちは ';

  @override
  String get tasks => 'タスク';

  @override
  String get completed => '完成品';

  @override
  String get searchTask => 'タスクを検索する';

  @override
  String get selectTime => '時間選択';

  @override
  String get selectDay => '曜日を選択';

  @override
  String get validateTime => '時間を選択する必要があります';

  @override
  String get validateDate => '日付を選択する必要があります。';

  @override
  String get errorConnection => 'インターネットに接続できない';

  @override
  String get notificationTitle => 'タスクの完了を忘れない';

  @override
  String get noItensFound => 'イテンが見つかりません';

  @override
  String get offline => 'あなたはオフラインです';

  @override
  String get online => 'あなたはオンラインです';

  @override
  String get sincyng => '同期中...';

  @override
  String get sync => '同期';

  @override
  String get confirmPasswordError => '確認用パスワードが一致しない';

  @override
  String get emailError => '無効な電子メール';

  @override
  String get nameError => '無効な名前';

  @override
  String get passwordError => 'パスワードが無効です';

  @override
  String get taskError => '無効なタスク';
}
