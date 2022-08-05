import 'package:core/translate/app_localizations.dart';

class EditTaskDTO {
  EditTaskDTO({
    DateTime? updateAt,
    this.id = 0,
    this.name = '',
    this.done = false,
    required this.deadlineAt,
    this.localizations,
  }) : updateAt = updateAt ?? DateTime.now();
  final int id;
  final String name;
  final bool done;
  final DateTime deadlineAt;
  final DateTime? updateAt;
  final AppLocalizations? localizations;
}
