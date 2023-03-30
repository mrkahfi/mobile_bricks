import 'package:mason/mason.dart';

void run(HookContext context) async {
  final firebaseProjectId = context.vars['firebaseProjectId'];
  final androidAppId = context.vars['androidAppId'];
  final iosBundleId = context.vars['iosBundleId'];
  context.logger.info(
      'Please run following command to configure Firebase projects for all the environments');
  context.logger.info('''
  flutterfire config \\
      --project=$firebaseProjectId \\
      --ios-bundle-id=$iosBundleId.dev \\
      --android-app-id=$androidAppId.dev \\
      --out=lib/src/app/firebase/firebase_options_dev.dart \
  ''');
  context.logger.info('''
  flutterfire config \\
      --project=$firebaseProjectId \\
      --ios-bundle-id=$iosBundleId.stg \\
      --android-app-id=$androidAppId.stg \\
      --out=lib/src/app/firebase/firebase_options_stg.dart \
  ''');
  context.logger.info('''
  flutterfire config \\
      --project=$firebaseProjectId \\
      --ios-bundle-id=$iosBundleId \\
      --android-app-id=$androidAppId \\
      --out=lib/src/app/firebase/firebase_options.dart \
  ''');
  context.logger
      .info('Or check ./README.md on how to configure Firebase projects');
}
