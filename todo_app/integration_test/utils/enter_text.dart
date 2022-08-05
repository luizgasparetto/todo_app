import 'package:flutter_test/flutter_test.dart';

Future<void> enterText(WidgetTester tester, Finder input, String text) async {
  await tester.tap(input);
  await tester.pumpAndSettle();
  await tester.enterText(input, text);
  await tester.pumpAndSettle();
}
