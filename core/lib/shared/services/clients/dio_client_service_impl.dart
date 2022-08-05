import 'package:core/core.dart';
import 'package:dependency_module/dependency_module.dart';

class DioClientServiceImpl implements IClientService {
  final Dio _dio;
  final ILocalStorageService _localStorageService;
  final AuthStore _store;
  final IGetUserInfoUsecase _getUserInfoUsecase;

  const DioClientServiceImpl(this._dio, this._localStorageService, this._store, this._getUserInfoUsecase);

  @override
  Future<ClientResponse> get(String endPoint, {bool interceptors = true}) async {
    await setupInterceptors(interceptors: interceptors);

    try {
      final response = await _dio.get(endPoint);

      return ClientResponse(data: response.data, statusCode: response.statusCode);
    } on DioError catch (e) {
      throw ClientException(message: e.response?.data['message'] ?? e.message, stackTrace: e.stackTrace!);
    }
  }

  @override
  Future<ClientResponse> post(String endPoint, Map<String, dynamic> body, {bool interceptors = true}) async {
    await setupInterceptors(interceptors: interceptors);

    try {
      final response = await _dio.post(endPoint, data: body);

      return ClientResponse(data: response.data, statusCode: response.statusCode);
    } on DioError catch (e) {
      throw ClientException(message: e.response?.data['message'] ?? e.message, stackTrace: e.stackTrace!);
    }
  }

  @override
  Future<ClientResponse> patch(String endPoint, Map<String, dynamic> body, {bool interceptors = true}) async {
    await setupInterceptors(interceptors: interceptors);

    try {
      final response = await _dio.patch(endPoint, data: body);

      return ClientResponse(data: response.data, statusCode: response.statusCode);
    } on DioError catch (e) {
      throw ClientException(message: e.response?.data['message'] ?? e.message, stackTrace: e.stackTrace!);
    }
  }

  @override
  Future<ClientResponse> delete(String endPoint, {bool interceptors = true}) async {
    await setupInterceptors(interceptors: interceptors);

    try {
      final response = await _dio.delete(endPoint);

      return ClientResponse(data: response.data, statusCode: response.statusCode);
    } on DioError catch (e) {
      throw ClientException(message: e.response?.data['message'] ?? e.message, stackTrace: e.stackTrace!);
    }
  }

  @override
  Future<void> setupInterceptors({required bool interceptors}) async {
    if (interceptors) {
      _dio.interceptors.add(AuthInterceptorImpl(_dio, _localStorageService, _store, _getUserInfoUsecase));
    } else {
      _dio.interceptors.clear();
    }
  }
}
