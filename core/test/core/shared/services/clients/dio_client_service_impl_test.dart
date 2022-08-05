import 'package:core/core.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

class LocalMock extends Mock implements ILocalStorageService {}

class AuthStoreMock extends Mock implements AuthStore {}

class GetUserInfoUsecaseMock extends Mock implements IGetUserInfoUsecase {}

void main() {
  late final Dio dio;
  late final ILocalStorageService localStorageService;
  late final AuthStore authStore;
  late final IGetUserInfoUsecase getUserInfoUsecase;
  late final IClientService sut;

  final goodResponse = Response(data: 'data', requestOptions: RequestOptions(path: 'path'));

  setUpAll(() {
    dio = DioMock();
    localStorageService = LocalMock();
    authStore = AuthStoreMock();
    getUserInfoUsecase = GetUserInfoUsecaseMock();
    sut = DioClientServiceImpl(dio, localStorageService, authStore, getUserInfoUsecase);
  });

  group('Dio Client Service | ', () {
    void mockSuccess() {
      when(() => dio.interceptors).thenAnswer((_) => Interceptors());
      when(() => dio.get(any())).thenAnswer((_) async => goodResponse);
    }

    test('should be able to estabilish connection and return a ClientResponse with correct data', () async {
      mockSuccess();

      final response = await sut.get('url', interceptors: false);

      expect(response, isA<ClientResponse>());
      expect(response.data, equals('data'));
    });

    test('should return a ClientException when dio have some error', () async {
      when(() => dio.interceptors).thenAnswer((_) => Interceptors());
      when(() => dio.get(any())).thenThrow(ClientException(message: 'Client Error', stackTrace: StackTrace.current));

      final response = sut.get('url', interceptors: false);

      expect(response, throwsA(isA<ClientException>()));
    });
  });
}
