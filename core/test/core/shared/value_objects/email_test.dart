import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final Email sut;

  setUpAll(() {
    sut = Email();
  });

  group('Email Value Object | ', () {
    test('should be valid when put a correct email', () {
      sut.value = 'test@test.com';

      expect(sut.isValid, equals(true));
      expect(sut.hasError(''), equals(null));
    });

    test('should be invalid when put a incorrect email', () {
      sut.value = 'test@email';
      final result = sut.hasError('Email is invalid');

      expect(sut.isValid, equals(false));
      expect(result, equals('Email is invalid'));
    });
  });
}
