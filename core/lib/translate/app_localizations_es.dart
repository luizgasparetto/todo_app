


import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get authSubtitle => 'Por favor, introduzca los datos siguientes para continuar';

  @override
  String get loginPageTitle => 'Inicie sesión.';

  @override
  String get loginButtonTitle => 'Iniciar sesión';

  @override
  String get loginToSignUp => '¿No tiene una cuenta?';

  @override
  String get loginCreateAccount => 'Crear una cuenta';

  @override
  String get registerPageTitle => 'Regístrese.';

  @override
  String get registerButtonTitle => 'Regístrese';

  @override
  String get registerToLogin => '¿Ya tienes una cuenta?';

  @override
  String get nameField => 'Nombre completo';

  @override
  String get emailField => 'Correo electrónico';

  @override
  String get passwordField => 'Contraseña';

  @override
  String get confirmPasswordField => 'Confirmar contraseña';

  @override
  String get taskNameField => 'Nombre de la tarea';

  @override
  String get taskNameLabel => 'El nombre de su tarea';

  @override
  String get taskDayLabel => 'Seleccione el día de su tarea';

  @override
  String get taskTimeLabel => 'Seleccione la hora de su tarea';

  @override
  String get createTask => 'Añadir tarea';

  @override
  String get editTask => 'Editar tarea';

  @override
  String get addTaskTitle => 'Añade tu tarea';

  @override
  String get addTaskSubtitle => 'Tenga las tareas de su día en la palma de su mano';

  @override
  String get errorStatusChange => 'No es posible cambiar el estado de la tarea porque ya ha expirado. Edite la tarea para cambiar el estado.';

  @override
  String get errorLogoutWithoutInterner => 'No puede cerrar la sesión porque está desconectado. Por favor, conéctese a Internet.';

  @override
  String get errorSync => 'No puedes cerrar la sesión porque estás sincronizando, ¡espera a que termine la sincronización!';

  @override
  String get notificationBody => 'Su tarea expirará en 30 minutos.';

  @override
  String get notificationSecondBody => 'El tiempo de tu tarea acaba de expirar.';

  @override
  String get homePageTitle => 'Hola ';

  @override
  String get tasks => 'Tareas';

  @override
  String get completed => 'Completado';

  @override
  String get searchTask => 'Busca tu tarea';

  @override
  String get selectTime => 'Seleccione la hora';

  @override
  String get selectDay => 'Seleccione el día';

  @override
  String get validateTime => '¡Tienes que seleccionar la hora!';

  @override
  String get validateDate => 'Debe seleccionar la fecha';

  @override
  String get errorConnection => 'No hay conexión a Internet';

  @override
  String get notificationTitle => 'No olvides completar la tarea';

  @override
  String get noItensFound => 'No se han encontrado itens';

  @override
  String get offline => 'Estás desconectado';

  @override
  String get online => 'Estás conectado';

  @override
  String get sincyng => 'Sincronización...';

  @override
  String get sync => 'Sincronizado';

  @override
  String get confirmPasswordError => 'La contraseña confirmada no coincide';

  @override
  String get emailError => 'Correo electrónico no válido';

  @override
  String get nameError => 'Nombre inválido';

  @override
  String get passwordError => 'Contraseña no válida';

  @override
  String get taskError => 'Tarea inválida';
}
