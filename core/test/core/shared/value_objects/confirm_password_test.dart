import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final ConfirmPassword sut;

  setUpAll(() {
    sut = ConfirmPassword();
  });

  group('Confirm Password Value Object | ', () {
    test('should be valid when confirm password matches with specifications',
        () {
      sut.password = '123456';
      sut.confirmPassword = '123456';

      expect(sut.isValid, equals(true));
      expect(sut.hasError(''), equals(null));
    });

    test(
        "should be invalid when confirm password doesn't matches with specifications",
        () {
      sut.password = '123456';
      sut.confirmPassword = '1234';
      final result = sut.hasError('Confirm password is invalid');

      expect(sut.isValid, equals(false));
      expect(result, equals('Confirm password is invalid'));
    });
  });
}
