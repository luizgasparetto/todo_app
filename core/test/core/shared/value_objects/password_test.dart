import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final Password sut;

  setUpAll(() {
    sut = Password();
  });

  group('Password Value Object | ', () {
    test('should return valid when password matches with specifications', () {
      sut.value = '123456';

      expect(sut.isValid, equals(true));
      expect(sut.hasError(''), equals(null));
    });

    test("should be invalid when password doesn't match with specifications",
        () {
      sut.value = '123';
      final result = sut.hasError('Password is invalid');

      expect(sut.isValid, equals(false));
      expect(result, equals('Password is invalid'));
    });
  });
}
