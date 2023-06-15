import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  context.logger.info(''' \ ''');
  final fixResult = await Process.run('dart', [
    'fix',
    '--apply',
  ]);
  context.logger.info(''' \
Executing flutter pub run build_runner build --delete-conflicting-outputs    \
''');
  final result = await Process.run('flutter',
      ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs']);
  stdout.write(result.stdout);
  stderr.write(result.stderr);

  stdout.write(fixResult.stdout);
  stderr.write(fixResult.stderr);
}
