import 'dart:convert';

import 'package:core/core.dart';
import 'package:core/user/external/mappers/user_entity_mapper.dart';
import 'package:dependency_module/dependency_module.dart';

class AuthInterceptorImpl extends Interceptor {
  final Dio _dio;
  final ILocalStorageService _storage;
  final AuthStore _store;
  final IGetUserInfoUsecase _getUserInfoUsecase;

  AuthInterceptorImpl(this._dio, this._storage, this._store, this._getUserInfoUsecase);

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final result = await _getUserInfoUsecase();

    result.fold((l) => _store.logout(), (user) {
      options.headers['Authorization'] = 'Bearer ${user.token}';
    });

    return handler.next(options);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response!.statusCode == 403 || err.response!.statusCode == 401) {
      final result = await _refreshTokenVerification();

      if (result) {
        final retryResponse = await _retryAuth(err.requestOptions);

        return handler.resolve(retryResponse);
      }

      return handler.next(err);
    }
  }

  Future<Response> _retryAuth(RequestOptions requestOptions) async {
    return _dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
      ),
    );
  }

  Future<bool> _refreshTokenVerification() async {
    final result = await _getUserInfoUsecase();

    return result.fold((l) => false, (user) async {
      final response = await _dio.get(AppApiConstants.refreshTokenEndPoint(user.refreshToken));

      if (response.statusCode == 201 || response.statusCode == 200) {
        _storage.setString(LocalDatabaseSetStringDTO(key: 'user', value: jsonEncode(UserEntityMapper.toMap(user))));

        return true;
      } else {
        _store.logout();
        return false;
      }
    });
  }
}
