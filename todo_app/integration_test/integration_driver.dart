import 'dart:io';
import 'package:integration_test/integration_test_driver_extended.dart';

const kPngExt = '.png';
const kParentDir = 'screenshots';

Future<void> main() async {
  await integrationDriver(
    onScreenshot: (id, bytes) async {
      final image =
          await File('$kParentDir/$id$kPngExt').create(recursive: true);

      await image.writeAsBytes(bytes);

      return true;
    },
  );
}
