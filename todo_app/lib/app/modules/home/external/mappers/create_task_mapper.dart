import '../../domain/dtos/create_task_dto.dart';
import '../errors/datasource_errors.dart';

class CreateTaskMapper {
  static Map<String, dynamic> toJson(CreateTaskDTO dto) {
    try {
      return {
        'name': dto.name,
        'done': dto.done,
        'createAt': dto.createAt.toIso8601String(),
        'updateAt': dto.updateAt.toIso8601String(),
        'deadlineAt': dto.deadlineAt.toIso8601String(),
      };
    } catch (e, s) {
      throw CreateTaskMapperException(message: e.toString(), stackTrace: s);
    }
  }
}
