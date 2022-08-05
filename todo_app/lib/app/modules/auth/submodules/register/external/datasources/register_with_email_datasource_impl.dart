import 'dart:convert';

import 'package:core/core.dart';
import 'package:core/user/external/mappers/user_entity_mapper.dart';

import '../../domain/dtos/register_with_email_dto.dart';
import '../../infra/datasources/i_register_with_email_datasource.dart';

class RegisterWithEmailDatasourceImpl implements IRegisterWithEmailDatasource {
  const RegisterWithEmailDatasourceImpl(this._clientService);

  final IClientService _clientService;

  @override
  Future<UserEntity> registerWithEmail(RegisterWithEmailDTO params) async {
    final registerBody = {'name': params.name, 'email': params.email, 'password': params.password};

    try {
      final result = await _clientService.post(AppApiConstants.registerEndPoint, registerBody, interceptors: false);

      return UserEntityMapper.fromMap(
        (result.data is String ? jsonDecode(result.data as String) : result.data) as Map<String, dynamic>,
      );
    } on IAppException {
      rethrow;
    } catch (e, s) {
      throw DatasourceException(message: e.toString(), stackTrace: s);
    }
  }
}
