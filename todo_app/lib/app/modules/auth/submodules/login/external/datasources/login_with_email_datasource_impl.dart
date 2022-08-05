import 'dart:convert';

import 'package:core/core.dart';

import '../../domain/dtos/login_with_email_dto.dart';
import '../../infra/datasources/i_login_with_email_datasource.dart';
import '../mappers/login_mapper.dart';

class LoginWithEmailDatasourceImpl implements ILoginDatasource {
  const LoginWithEmailDatasourceImpl(this._clientService);

  final IClientService _clientService;

  @override
  Future<UserEntity> loginWithEmail(LoginWithEmailDTO params) async {
    try {
      final loginBody = {'email': params.email, 'password': params.password};

      final result = await _clientService.post(AppApiConstants.loginEndPoint, loginBody, interceptors: false);

      return LoginMapper.fromMap(
        (result.data is String ? jsonDecode(result.data as String) : result.data) as Map<String, dynamic>,
      );
    } on IAppException {
      rethrow;
    } catch (e, s) {
      throw DatasourceException(message: e.toString(), stackTrace: s);
    }
  }
}
