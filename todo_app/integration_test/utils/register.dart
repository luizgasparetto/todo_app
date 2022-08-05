import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tads_design_system/tads_design_system.dart';

import 'has_match.dart';

Future<void> registerIntoTheApp(
  WidgetTester tester, {
  bool errorIfMissed = false,
}) async {
  final fake = Faker();
  await tester.pumpAndSettle();
  await tester.dragUntilVisible(
      find.text('Create Account'),
      find.byType(SingleChildScrollView),
      const Offset(0, 200),
    );
  await tester.tap(find.text('Create Account'));
  await tester.pumpAndSettle();

  final allInputs = find.byType(TextFormField);
  final hasTextField = hasMatch(findsNWidgets(4), allInputs);

  if (hasTextField) {
    await tester.enterText(allInputs.at(0), fake.person.name());
    await tester.enterText(allInputs.at(1), fake.internet.email());
    await tester.enterText(allInputs.at(2), '123456');
    await tester.enterText(allInputs.at(3), '123456');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    final submitButton = find.byType(TADSCustomButton);
    await tester.dragUntilVisible(
      find.byType(TADSCustomButtonWithPhrase),
      find.byType(SingleChildScrollView),
      const Offset(0, 200),
    );
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(submitButton);
    await tester.pump(const Duration(seconds: 10));
  }
}
