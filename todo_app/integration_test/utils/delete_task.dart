import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> deleteTaskIntoTheApp(
  WidgetTester tester, {
  bool errorIfMissed = false,
}) async {
  await tester.pumpAndSettle();
  await tester.drag(
    find.byType(Dismissible).first,
    const Offset(-500.0, 0.0),
  );
  await tester.pump(const Duration(seconds: 5));
}
