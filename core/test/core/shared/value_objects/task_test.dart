import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final Task sut;

  setUpAll(() {
    sut = Task();
  });

  group('Task Value Object | ', () {
    test('should return valid when task matches with specifications', () {
      sut.value = 'my own task';

      expect(sut.isValid, equals(true));
      expect(sut.hasError(''), equals(null));
    });

    test("should be invalid when task doesn't match with specifications", () {
      sut.value = 'xxx';
      final result = sut.hasError('Task is invalid');

      expect(sut.isValid, equals(false));
      expect(result, equals('Task is invalid'));
    });
  });
}
