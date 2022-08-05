import 'dart:io';

const _kTestModeKey = 'TEST_MODE';

final separator = Platform.isWindows ? '\\' : '/';
final integrationTestParentDir = 'integration_test${separator}e2e';
final workingDirectory = '.$separator';

const kFlutter = 'flutter';
const kAdb = 'adb';

const kDefaultIntegrationDriverPath = 'integration_test/integration_driver.dart';

const kRequiredPermissions = [
  // 'android.permission.READ_EXTERNAL_STORAGE',
  // 'android.permission.WRITE_EXTERNAL_STORAGE',
  // 'android.permission.CAMERA',
  // 'android.permission.RECORD_AUDIO',
  // 'android.permission.ACCESS_FINE_LOCATION',
  // 'android.permission.ACCESS_COARSE_LOCATION',
];

const kAppPackageId = 'com.example.todo_do_app';

void _write(String message) => stdout.writeln('[$kAppPackageId]: $message');

ProcessResult _logResult(
  ProcessResult result, {
  String errorDescription = '',
  String successDescription = '',
  bool throwIfError = false,
}) {
  final err = '$errorDescription\n${result.stderr ?? ''}';
  final out = '$successDescription\n${result.stdout ?? ''}';

  if (err.isNotEmpty) {
    stdout.writeln(out);
  }

  if (out.isNotEmpty) {
    stdout.writeln(out);
  }

  if (result.exitCode != 0 && throwIfError) {
    throw result.stderr as Object;
  }

  return result;
}

Future<ProcessResult> _run(String executable, List<String> arguments) async =>
    Process.run(
      executable,
      arguments,
      workingDirectory: workingDirectory,
      runInShell: true,
    );

bool _isFileEqualTo(File file, String filename) =>
    file.uri.pathSegments.last == filename;

Future<void> main(List<String> args) async {
  final target = args.isEmpty ? null : args.first;

  final parentDir = Directory(integrationTestParentDir);

  if (!parentDir.existsSync()) {
    throw Exception('Invalid parent dir: ${parentDir.path}');
  }

  final tests = parentDir.listSync().whereType<File>().toList();

  if (tests.isEmpty) {
    throw Exception('No test files found in parent dir: ${parentDir.path}');
  }

  if (target != null && !tests.any((test) => _isFileEqualTo(test, target))) {
    throw Exception('Invalid integration test: $target');
  }

  for (final test in tests) {
    if (target == null || _isFileEqualTo(test, target)) {
      await _runIntegrationTest(test.path);
    }
  }
}

Future<void> _runIntegrationTest(
  String target, {
  String driver = kDefaultIntegrationDriverPath,
}) async {
  _write('Starting Apk install for $target');

  await installBuild();

  final driverArg = '--driver=$driver';
  final targetArg = '--target=$target';

  const permissions = kRequiredPermissions;

  _write('Starting Add Permissions for $target');

  for (final permission in permissions) {
    await _grantPermission(permission as String);
  }

  const kTestModeArg = '--dart-define=$_kTestModeKey=true';

  _write(
    'Starting [flutter drive] for target=$target and driver=$driver | $kTestModeArg',
  );

  _logResult(
    await _run(kFlutter, ['drive', kTestModeArg, driverArg, targetArg]),
    throwIfError: true,
  );
}

Future<void> _grantPermission(String permission) async {
  final args = [
    'shell',
    'pm',
    'grant',
    kAppPackageId,
    permission,
  ];

  _logResult(
    await _run(kAdb, args),
    successDescription: 'Permission $permission granted to $kAppPackageId',
  );
}

Future<void> installBuild() async {
  _logResult(await _run(kFlutter, ['install']));
}
