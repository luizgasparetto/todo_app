import 'package:dependency_module/dependency_module.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> logoutOfTheApp(
  WidgetTester tester, {
  bool errorIfMissed = false,
}) async {
  await tester.tap(find.byIcon(IconlyLight.logout));
  await tester.pumpAndSettle(const Duration(seconds: 5));
}
