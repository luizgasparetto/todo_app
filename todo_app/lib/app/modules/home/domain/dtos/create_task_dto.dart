import 'package:core/translate/app_localizations.dart';

class CreateTaskDTO {
  CreateTaskDTO({
    this.id,
    this.name = '',
    this.done = false,
    required this.createAt,
    required this.updateAt,
    required this.deadlineAt,
    this.localizations,
  });
  final String name;
  final bool done;
  final DateTime createAt;
  final DateTime updateAt;
  final DateTime deadlineAt;
  int? id;
  final AppLocalizations? localizations;
}
