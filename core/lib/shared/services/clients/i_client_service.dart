abstract class IClientService {
  Future<ClientResponse> get(String endPoint, {bool interceptors = true});
  Future<ClientResponse> post(String endPoint, Map<String, dynamic> body, {bool interceptors = true});
  Future<ClientResponse> patch(String endPoint, Map<String, dynamic> body, {bool interceptors = true});
  Future<ClientResponse> delete(String endPoint, {bool interceptors = true});
  Future<void> setupInterceptors({required bool interceptors});
}

class ClientResponse {
  final dynamic data;
  final int? statusCode;
  final Map<String, dynamic>? headers;

  const ClientResponse({
    required this.data,
    this.statusCode,
    this.headers,
  });
}
