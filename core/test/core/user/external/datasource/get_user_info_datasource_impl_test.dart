import 'package:core/core.dart';
import 'package:core/user/external/datasources/get_user_info_datasource_impl.dart';
import 'package:core/user/infra/datasources/i_get_user_info_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/json_user.dart';

class LocalStorageServiceMock extends Mock implements ILocalStorageService {}

void main() {
  late final ILocalStorageService prefs;
  late final IGetUserInfoDatasource sut;

  setUpAll(() {
    prefs = LocalStorageServiceMock();
    sut = GetUserInfoDatasourceImpl(prefs);
  });

  setUp(() {
    registerFallbackValue(const LocalDatabaseGetStringDTO(key: ''));
  });

  group('GetUserInfo Datasource | ', () {
    test('should return a UserEntity in Datasource', () async {
      when(() => prefs.getString(any())).thenAnswer((_) async => jsonUser);

      final result = await sut.getUserInfo();

      expect(result, isA<UserEntity>());
    });

    test('should a empty UserEntity when storage returns null', () async {
      when(() => prefs.getString(any())).thenAnswer((_) async => null);

      final result = await sut.getUserInfo();

      expect(result.token, isEmpty);
      expect(result.refreshToken, isEmpty);
    });
  });
}
