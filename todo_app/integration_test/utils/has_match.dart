import 'package:flutter_test/flutter_test.dart';

bool hasMatch(Matcher matcher, Finder finder) {
  try {
    return matcher.matches(finder, {});
  } catch (e) {
    return false;
  }
}
