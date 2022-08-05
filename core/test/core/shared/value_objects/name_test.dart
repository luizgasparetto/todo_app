import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final Name sut;

  setUpAll(() {
    sut = Name();
  });

  group('Name Value Object | ', () {
    test('should be valid when name isNotEmpty and have 3 letters or more', () {
      sut.value = 'Test Name';

      expect(sut.isValid, equals(true));
      expect(sut.hasError(''), equals(null));
    });

    test('should not be valid when name have less then 3 letters', () {
      sut.value = 'xx';
      final result = sut.hasError('Name is invalid');

      expect(sut.isValid, equals(false));
      expect(result, equals('Name is invalid'));
    });
  });
}
