import 'package:core/core.dart';

class AuthState {
  const AuthState();
}

class AuthInitialState extends AuthState {}

class AuthLoggedState extends AuthState {
  final UserEntity user;

  const AuthLoggedState({required this.user});
}

class AuthLoggedOutState extends AuthState {}
