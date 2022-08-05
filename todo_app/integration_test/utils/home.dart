import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> verifyHomeIntoTheApp(
  WidgetTester tester, {
  bool errorIfMissed = false,
}) async {
  await tester.pumpAndSettle();
  await tester.dragUntilVisible(
    find.byType(Divider),
    find.byType(CustomScrollView),
    const Offset(0, 200),
  );
  await tester.pumpAndSettle(const Duration(seconds: 5));
}
