import 'package:dependency_module/dependency_module.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tads_design_system/tads_design_system.dart';

Future<void> editTaskIntoTheApp(
  WidgetTester tester, {
  bool errorIfMissed = false,
}) async {
  final fake = Faker();
  await tester.pumpAndSettle();
  await tester.drag(find.byType(Dismissible).first, const Offset(500.0, 0.0));
  await tester.pumpAndSettle();
  await tester.tap(find.byType(TextField));
  await tester.pumpAndSettle();
  await tester.enterText(find.byType(TextField), fake.job.title());
  await tester.testTextInput.receiveAction(TextInputAction.done);
  await tester.pumpAndSettle();
  await tester.tap(find.byType(DatePicker));
  await tester.pumpAndSettle();
  await tester.dragUntilVisible(
    find.byType(TADSCustomButton),
    find.byType(SingleChildScrollView),
    const Offset(0, 200),
  );
  final submitButton = find.byType(TADSCustomButton);
  await tester.pumpAndSettle(const Duration(seconds: 1));
  await tester.tap(submitButton);
  await tester.pumpAndSettle(const Duration(seconds: 5));
}
