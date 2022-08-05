import 'package:todo_do_app/app/modules/home/domain/entities/task_entity.dart';

class UserEntity {
  UserEntity({
    this.id = 0,
    this.name = '',
    this.email = '',
    this.token = '',
    this.refreshToken = '',
    List<TaskEntity>? tasks,
  }) : tasks = tasks ?? [];

  final int id;
  final String name;
  final String email;
  final String token;
  final String refreshToken;
  final List<TaskEntity> tasks;

  UserEntity copyWith({String? name, String? token, String? refreshToken, List<TaskEntity>? tasks}) {
    return UserEntity(
      id: id,
      name: name ?? this.name,
      email: email,
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
      tasks: tasks ?? this.tasks,
    );
  }

  factory UserEntity.empty() => UserEntity();
}
