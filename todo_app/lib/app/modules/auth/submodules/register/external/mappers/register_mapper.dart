import 'package:core/core.dart';

import '../errors/datasource_errors.dart';

class RegisterMapper {
  static UserEntity fromMap(Map<String, dynamic> json) {
    try {
      return UserEntity(
        id: json['id'] as int,
        name: json['name'] as String,
        email: json['email'] as String,
        refreshToken: json['refreshToken'] as String,
        token: json['token'] as String,
        tasks: [],
      );
    } catch (e, s) {
      throw RegisterMapperException(message: e.toString(), stackTrace: s);
    }
  }
}
