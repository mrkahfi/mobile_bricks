import 'package:mason/mason.dart';
import 'dart:io';

void run(HookContext context) {
  context.logger.info('Executing flutterfire config...');
  // Read vars.
  final firebaseProjectId = context.vars['firebaseProjectId'];
  final androidAppId = context.vars['androidAppId'];
  final iosBundleId = context.vars['iosBundleId'];

  // Use the `Logger` instance.
  context.logger.info('iosBundleId $iosBundleId!');
  context.logger.info('androidAppId $androidAppId');
  context.logger.info('firebaseProjectId $firebaseProjectId');

  // config for dev
  Process.run('flutterfire', [
    'config',
    '--project=$firebaseProjectId',
    '--ios-bundle-id=$iosBundleId.dev',
    '--android-app-id=$androidAppId.dev',
    '--out=--out=lib/src/app/firebase/firebase_options_dev.dart'
  ]).then((result) {
    stdout.write(result.stdout);
    stderr.write(result.stderr);
  });

  // config for stg
  Process.run('flutterfire', [
    'config',
    '--project=$firebaseProjectId',
    '--ios-bundle-id=$iosBundleId.stg',
    '--android-app-id=$androidAppId.stg',
    '--out=--out=lib/src/app/firebase/firebase_options_stg.dart'
  ]).then((result) {
    stdout.write(result.stdout);
    stderr.write(result.stderr);
  });

  // config for prod
  Process.run('flutterfire', [
    'config',
    '--project=$firebaseProjectId',
    '--ios-bundle-id=$iosBundleId',
    '--android-app-id=$androidAppId',
    '--out=--out=lib/src/app/firebase/firebase_options.dart'
  ]).then((result) {
    stdout.write(result.stdout);
    stderr.write(result.stderr);
  });
}
