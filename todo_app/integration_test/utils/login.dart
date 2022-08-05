import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tads_design_system/tads_design_system.dart';

import 'enter_text.dart';
import 'has_match.dart';

Future<void> loginIntoTheApp(
  WidgetTester tester, {
  bool errorIfMissed = false,
}) async {
  await tester.pumpAndSettle();

  final allInputs = find.byType(TextFormField);
  final hasTextField = hasMatch(findsNWidgets(2), allInputs);

  if (hasTextField) {
    final usernameInput = allInputs.first;
    final passwordInput = allInputs.last;

    await enterText(tester, usernameInput, 'teste@teste.com');
    await enterText(tester, passwordInput, '123456');

    final submitButton = find.byType(TADSCustomButton);
    await tester.dragUntilVisible(
      find.byType(TADSCustomButtonWithPhrase),
      find.byType(SingleChildScrollView),
      const Offset(0, 200),
    );

    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(submitButton);

    await tester.pumpAndSettle(const Duration(seconds: 12));
  }
}
