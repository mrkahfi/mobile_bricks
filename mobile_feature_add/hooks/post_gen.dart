import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  context.logger.info(''' \ ''');
  context.logger.info(''' \
Executing flutter pub run build_runner build --delete-conflicting-outputs    \
''');
  var result = await Process.run('flutter',
      ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs']);
  stdout.write(result.stdout);
  stderr.write(result.stderr);
}
