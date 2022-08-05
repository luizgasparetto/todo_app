import '../../domain/entities/task_entity.dart';
import '../errors/datasource_errors.dart';

class TaskEntityMapper {
  static TaskEntity fromMap(Map<String, dynamic> json) {
    try {
      return TaskEntity(
        id: json['id'] as int,
        name: json['name'] as String,
        createAt: DateTime.parse(json['createAt'] as String),
        deadlineAt: DateTime.parse(json['deadlineAt']   as String),
        done: json['done'] as bool,
        updateAt: DateTime.parse(json['updateAt'] as String),
      );
    } catch (error, stackTrace) {
      throw TaskMapperException(message: error.toString(), stackTrace: stackTrace);
    }
  }

  static Map<String, dynamic> toMap(TaskEntity entity) {
    try {
      return {
        'id': entity.id,
        'name': entity.name,
        'done': entity.done,
        'createAt': entity.createAt.toIso8601String(),
        'updateAt': entity.updateAt.toIso8601String(),
        'deadlineAt': entity.deadlineAt.toIso8601String(),
      };
    } catch (error, stackTrace) {
      throw TaskMapperException(message: error.toString(), stackTrace: stackTrace);
    }
  }
}
