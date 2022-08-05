import 'package:todo_do_app/app/modules/home/external/mappers/task_entity_mapper.dart';

import '../../domain/entities/user_entity.dart';
import '../errors/datasource_errors.dart';

class UserEntityMapper {
  static UserEntity fromMap(Map<String, dynamic> json) {
    try {
      final tasks = json['tasks'] as List?;

      return UserEntity(
        name: json['name'],
        email: json['email'],
        refreshToken: json['refreshToken'],
        token: json['token'],
        tasks: tasks != null ? tasks.map((e) => TaskEntityMapper.fromMap(e)).toList() : [],
      );
    } catch (e, st) {
      throw UserMapperException(message: e.toString(), stackTrace: st);
    }
  }

  static Map<String, dynamic> toMap(UserEntity user) {
    try {
      return {
        'name': user.name,
        'email': user.email,
        'refreshToken': user.refreshToken,
        'token': user.token,
        'tasks': user.tasks.map((e) => TaskEntityMapper.toMap(e)).toList(),
      };
    } catch (e, st) {
      throw UserMapperException(message: e.toString(), stackTrace: st);
    }
  }
}
