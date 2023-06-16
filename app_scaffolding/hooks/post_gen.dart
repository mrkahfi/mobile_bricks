import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final devFirebaseProjectId = context.vars['devFirebaseProjectId'];
  final stgFirebaseProjectId = context.vars['stgFirebaseProjectId'];
  final prodFirebaseProjectId = context.vars['prodFirebaseProjectId'];
  final androidAppId = context.vars['androidAppId'];
  final iosBundleId = context.vars['iosBundleId'];

  context.logger.info(''' \ ''');

  context.logger.info(''' \
Getting dependencies... \
''');

  var pubResult = await Process.run('dart', [
    'pub',
    'get',
  ]);

  stdout.write(pubResult.stdout);
  stderr.write(pubResult.stderr);

  // dart pub global activate --source="git" https://github.com/zero-one-group/flutterfire_cli
  // --git-path=packages/flutterfire_cli --git-ref=flutterfire_cli-zero-one  --executable="flutterfire" --overwrite
  var result = await Process.run('dart', [
    'pub',
    'global',
    'activate',
    '--source=git',
    'https://github.com/zero-one-group/flutterfire_cli',
    '--git-path=packages/flutterfire_cli',
    '--git-ref=flutterfire_cli-zero-one',
    '--executable=flutterfire',
    '--overwrite',
  ]);
  stdout.write(result.stdout);
  stderr.write(result.stderr);

  // await Process.run('dart', [
  //   'pub',
  //   'global',
  //   'activate',
  //   'flutterfire_cli',
  //   '0.3.0-dev.16',
  //   '--overwrite',
  // ]);

  context.logger.info(''' \
Configuring firebase for development... \
  ''');

  var devResult = await Process.run('flutterfire', [
    'config',
    '--project=$devFirebaseProjectId',
    '--ios-bundle-id=$iosBundleId.dev',
    '--ios-out=ios/config/dev/GoogleService-Info.plist',
    '--android-package-name=$androidAppId.dev',
    '--android-out=/android/app/src/dev/google-services.json',
    '--out=lib/src/app/firebase/firebase_options_dev.dart',
  ]);
  stdout.write(devResult.stdout);
  stderr.write(devResult.stderr);

  if (devResult.stderr.length > 0) {
    context.logger.info('''
Something wrong happened. Consider run this command manually. \
    ''');
    context.logger.info('''
    flutterfire config \\
        --project=$devFirebaseProjectId \\
        --ios-bundle-id=$iosBundleId.dev \\
        --ios-out=ios/config/dev/GoogleService-Info.plist \\
        --android-package-name=$androidAppId.dev \\
        --android-out=/android/app/src/dev/google-services.json \\
        --out=lib/src/app/firebase/firebase_options_dev.dart \
    ''');
  }

  context.logger.info(''' \
Configuring firebase for staging... \
  ''');

  var stgResult = await Process.run('flutterfire', [
    'config',
    '--project=$stgFirebaseProjectId',
    '--ios-bundle-id=$iosBundleId.stg',
    '--ios-out=ios/config/stg/GoogleService-Info.plist',
    '--android-package-name=$androidAppId.stg',
    '--android-out=/android/app/src/stg/google-services.json',
    '--out=lib/src/app/firebase/firebase_options_stg.dart',
  ]);
  stdout.write(stgResult.stdout);
  stderr.write(stgResult.stderr);

  if (stgResult.stderr.length > 0) {
    context.logger.info('''
Something wrong happened. Consider run this command manually. \
    ''');
    context.logger.info('''
    flutterfire config \\
        --project=$stgFirebaseProjectId \\
        --ios-bundle-id=$iosBundleId.stg \\
        --ios-out=ios/config/stg/GoogleService-Info.plist \\
        --android-package-name=$androidAppId.stg \\
        --android-out=/android/app/src/stg/google-services.json \\
        --out=lib/src/app/firebase/firebase_options_stg.dart \
    ''');
  }

  context.logger.info(''' \
Configuring firebase for production... \
  ''');

  var prodResult = await Process.run('flutterfire', [
    'config',
    '--project=$prodFirebaseProjectId',
    '--ios-bundle-id=$iosBundleId',
    '--ios-out=ios/config/prod/GoogleService-Info.plist',
    '--android-package-name=$androidAppId',
    '--android-out=/android/app/src/main/google-services.json',
    '--out=lib/src/app/firebase/firebase_options.dart',
  ]);
  stdout.write(prodResult.stdout);
  stderr.write(prodResult.stderr);

  if (prodResult.stderr.length > 0) {
    context.logger.info('''
Something wrong happened. Consider run this command manually. \
    ''');
    context.logger.info('''
    flutterfire config \\
        --project=$prodFirebaseProjectId \\
        --ios-bundle-id=$iosBundleId \\
        --ios-out=ios/config/prod/GoogleService-Info.plist \\
        --android-package-name=$androidAppId \\
        --android-out=/android/app/src/main/google-services.json \\
        --out=lib/src/app/firebase/firebase_options.dart \
    ''');
  }
  context.logger.info('''
Or check ./README.md on how to configure Firebase projects \ 
      ''');
}
