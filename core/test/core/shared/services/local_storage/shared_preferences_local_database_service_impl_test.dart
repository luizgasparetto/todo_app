import 'package:core/core.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SharedPreferencesMock extends Mock implements SharedPreferences {}

void main() {
  late final SharedPreferences prefs;
  late final ILocalStorageService sut;

  late final LocalDatabaseGetStringDTO getStringDTO;
  late final LocalDatabaseSetStringDTO setStringDTO;

  setUpAll(() {
    prefs = SharedPreferencesMock();
    sut = const SharedPreferencesLocalStorageServiceImpl();

    getStringDTO = const LocalDatabaseGetStringDTO(key: 'key');
    setStringDTO = const LocalDatabaseSetStringDTO(key: 'key', value: 'value');
  });

  group('Shared Preferences Service | ', () {
    test(
      'should be able to save an string with an key and get this value before',
      () async {
        when(() => prefs.getString(any())).thenAnswer((_) => 'value');
        when(() => prefs.setString(any(), any())).thenAnswer((_) async => true);

        await sut.setString(setStringDTO);

        final response = await sut.getString(getStringDTO);

        expect(response, isNotEmpty);
        expect(response, equals('value'));
      },
    );

    test(
      'should return null when try to get a deleted key',
      () async {
        when(() => prefs.getString(any())).thenReturn('value');

        await sut.delete(const LocalDatabaseDeleteDTO(key: 'key'));

        final response = await sut.getString(getStringDTO);

        expect(response, equals(null));
      },
    );
  });
}
