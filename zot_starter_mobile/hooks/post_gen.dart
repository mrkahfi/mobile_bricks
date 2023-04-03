import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final firebaseProjectId = context.vars['firebaseProjectId'];
  final androidAppId = context.vars['androidAppId'];
  final iosBundleId = context.vars['iosBundleId'];

  context.logger.info('Activating flutterfire_cli 0.3.0-dev.16 globally');

  await Process.run('dart', [
    'pub',
    'global',
    'activate',
    'flutterfire_cli',
    '0.3.0-dev.16',
    '--overwrite',
  ]);

  context.logger.info(
      'Please run following command to configure Firebase projects for all the environments. \\');

  context.logger.info('''
  flutterfire config \\
      --project=$firebaseProjectId \\
      --ios-bundle-id=$iosBundleId.dev \\
      --ios-out=ios/config/dev/GoogleService-Info.plist \\
      --android-app-id=$androidAppId.dev \\
      --out=lib/src/app/firebase/firebase_options_dev.dart \
  ''');
  context.logger.info('''
  flutterfire config \\
      --project=$firebaseProjectId \\
      --ios-bundle-id=$iosBundleId.stg \\
      --ios-out=ios/config/stg/GoogleService-Info.plist \\
      --android-app-id=$androidAppId.stg \\
      --out=lib/src/app/firebase/firebase_options_stg.dart \
  ''');
  context.logger.info('''
  flutterfire config \\
      --project=$firebaseProjectId \\
      --ios-bundle-id=$iosBundleId \\
      --ios-out=ios/config/prod/GoogleService-Info.plist \\
      --android-app-id=$androidAppId \\
      --out=lib/src/app/firebase/firebase_options.dart \
  ''');
  context.logger
      .info('Or check ./README.md on how to configure Firebase projects');

  context.logger.info('\x1B[33mNOTE:\x1B[0m If you are prompted '
      '\x1B[33m\'Would you like your iOS GoogleService-Info.plist to be associated with your iOS Build configuration '
      'or Target?\'\x1B[0m, ');
  context.logger.info(
      'DO select \x1B[33m\'No, I want to write the file to the path I chose\'\x1B[0m');
}
