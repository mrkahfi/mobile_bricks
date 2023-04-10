import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final firebaseProjectId = context.vars['firebaseProjectId'];
  final androidAppId = context.vars['androidAppId'];
  final iosBundleId = context.vars['iosBundleId'];

  context.logger.info(''' \
    Activating flutterfire_cli zero-one globally... \
''');

  // dart pub global activate --source="git" https://github.com/zero-one-group/flutterfire_cli
  // --git-path=packages/flutterfire_cli --git-ref=flutterfire_cli-zero-one  --executable="flutterfire" --overwrite
  await Process.run('dart', [
    'pub',
    'global',
    'activate',
    '--source=\"git\"',
    'https://github.com/zero-one-group/flutterfire_cli',
    '--git-path=packages/flutterfire_cli',
    '--git-ref=flutterfire_cli-zero-one',
    '--executable=\"flutterfire\"',
    '--overwrite',
  ]);

  // await Process.run('dart', [
  //   'pub',
  //   'global',
  //   'activate',
  //   'flutterfire_cli',
  //   '0.3.0-dev.16',
  //   '--overwrite',
  // ]);

  var devResult = await Process.run('flutterfire', [
    'config',
    '--project=$firebaseProjectId',
    '--ios-bundle-id=$iosBundleId.dev',
    '--ios-out=ios/config/dev/GoogleService-Info.plist',
    '--android-package-name=$androidAppId.dev',
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
        --project=$firebaseProjectId \\
        --ios-bundle-id=$iosBundleId.dev \\
        --ios-out=ios/config/dev/GoogleService-Info.plist \\
        --android-package-name=$androidAppId.dev \\
        --out=lib/src/app/firebase/firebase_options_dev.dart \
    ''');
  }

  var stgResult = await Process.run('flutterfire', [
    'config',
    '--project=$firebaseProjectId',
    '--ios-bundle-id=$iosBundleId.stg',
    '--ios-out=ios/config/stg/GoogleService-Info.plist',
    '--android-package-name=$androidAppId.stg',
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
        --project=$firebaseProjectId \\
        --ios-bundle-id=$iosBundleId.stg \\
        --ios-out=ios/config/stg/GoogleService-Info.plist \\
        --android-package-name=$androidAppId.stg \\
        --out=lib/src/app/firebase/firebase_options_stg.dart \
    ''');
  }

  var prodResult = await Process.run('flutterfire', [
    'config',
    '--project=$firebaseProjectId',
    '--ios-bundle-id=$iosBundleId',
    '--ios-out=ios/config/prod/GoogleService-Info.plist',
    '--android-package-name=$androidAppId',
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
        --project=$firebaseProjectId \\
        --ios-bundle-id=$iosBundleId \\
        --ios-out=ios/config/prod/GoogleService-Info.plist \\
        --android-package-name=$androidAppId \\
        --out=lib/src/app/firebase/firebase_options.dart \
    ''');
  }
  context.logger.info('''
Or check ./README.md on how to configure Firebase projects \ 
      ''');
}
