import '../../domain/dtos/edit_task_dto.dart';
import '../errors/datasource_errors.dart';

class EditTaskMapper {
  static Map<String, dynamic> toMap(EditTaskDTO dto) {
    try {
      return {
        'name': dto.name,
        'done': dto.done,
        'deadlineAt': dto.deadlineAt.toIso8601String(),
        'updateAt': dto.updateAt?.toIso8601String(),
      };
    } catch (e, s) {
      throw EditTaskMapperException(message: e.toString(), stackTrace: s);
    }
  }
}
