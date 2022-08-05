import 'package:core/core.dart';

import '../errors/datasource_errors.dart';

class LoginMapper {
  static UserEntity fromMap(Map<String, dynamic> json) {
    try {
      return UserEntity(
        id: json['id'] as int,
        name: json['name'] as String,
        email: json['email'] as String,
        token: json['token'] as String,
        refreshToken: json['refreshToken'] as String,
      );
    } catch (e, st) {
      throw LoginMapperException(message: e.toString(), stackTrace: st);
    }
  }

  static Map<String, dynamic> toMap(UserEntity user) {
    try {
      return {
        'id': user.id,
        'name': user.name,
        'email': user.email,
        'token': user.token,
        'refreshToken': user.refreshToken,
      };
    } catch (e, st) {
      throw LoginMapperException(message: e.toString(), stackTrace: st);
    }
  }
}
