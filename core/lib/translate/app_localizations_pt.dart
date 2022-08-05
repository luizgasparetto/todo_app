


import 'app_localizations.dart';

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get authSubtitle => 'Por favor, insira os detalhes abaixo para continuar';

  @override
  String get loginPageTitle => 'Entrar.';

  @override
  String get loginButtonTitle => 'Entrar';

  @override
  String get loginToSignUp => 'Não tem uma conta?';

  @override
  String get loginCreateAccount => 'Crie uma conta';

  @override
  String get registerPageTitle => 'Inscrever-se.';

  @override
  String get registerButtonTitle => 'Inscrever-se';

  @override
  String get registerToLogin => 'Já tem uma conta?';

  @override
  String get nameField => 'Nome completo';

  @override
  String get emailField => 'E-mail';

  @override
  String get passwordField => 'Senha';

  @override
  String get confirmPasswordField => 'Confirme Senha';

  @override
  String get taskNameField => 'Tarefa';

  @override
  String get taskNameLabel => 'Nome da sua tarefa';

  @override
  String get taskDayLabel => 'Selecione o dia da sua tarefa';

  @override
  String get taskTimeLabel => 'Selecione a hora da sua tarefa';

  @override
  String get createTask => 'Adicionar tarefa';

  @override
  String get editTask => 'Editar tarefa';

  @override
  String get addTaskTitle => 'Adicione sua tarefa';

  @override
  String get addTaskSubtitle => 'Tenha as tarefas do seu dia na palma da sua mão';

  @override
  String get errorStatusChange => 'Tenha as tarefas do seu dia na palma da mão Não é possível alterar o status da tarefa porque ela já expirou. Edite a tarefa para alterar o status.';

  @override
  String get errorLogoutWithoutInterner => 'Você não pode sair porque está offline! Por favor, conecte-se à internet.';

  @override
  String get errorSync => 'Você não pode sair porque está sincronizando, espere a sincronização terminar!';

  @override
  String get notificationBody => 'Sua tarefa expirará em 30 minutos!';

  @override
  String get notificationSecondBody => 'O tempo de sua tarefa acabou de expirar!';

  @override
  String get homePageTitle => 'Olá ';

  @override
  String get tasks => 'Tarefas';

  @override
  String get completed => 'Completas';

  @override
  String get searchTask => 'Busque por sua tarefa';

  @override
  String get selectTime => 'Hora';

  @override
  String get selectDay => 'Data';

  @override
  String get validateTime => 'Você precisa selecionar a hora!';

  @override
  String get validateDate => 'Você precisa selecionar a data!';

  @override
  String get errorConnection => 'Sem conexão com a internet';

  @override
  String get notificationTitle => 'Não se esqueça de completar a tarefa';

  @override
  String get noItensFound => 'Tarefas não encontradas';

  @override
  String get offline => 'Sem acesso à internet';

  @override
  String get online => 'Conectado à internet';

  @override
  String get sincyng => 'Sincronizando...';

  @override
  String get sync => 'Sincronizado';

  @override
  String get confirmPasswordError => 'As senhas não correspondem';

  @override
  String get emailError => 'Email Inválido';

  @override
  String get nameError => 'Nome Inválido';

  @override
  String get passwordError => 'Senha Inválida';

  @override
  String get taskError => 'Tarefa Inválida';
}
