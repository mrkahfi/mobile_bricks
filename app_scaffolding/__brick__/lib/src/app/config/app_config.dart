import 'package:firebase_core/firebase_core.dart';
import 'package:{{ packageName }}/src/app/firebase/firebase_options.dart';
import 'package:{{ packageName }}/src/app/firebase/firebase_options_stg.dart'
    as stg;
import 'package:{{ packageName }}/src/app/firebase/firebase_options_dev.dart'
    as dev;

import '../config/flavor_config.dart';

/// A config that serves as a source of configuration regarding this app in general.
///
/// Such as appName, version, etc related to the application.
/// And here you can also use FlavorConfig to create different values for each environment.
///
///
/// Example:
///
/// ```dart
/// static const appName = FlavorConfig<String>(
///    dev: 'App Dev',
///    prod: 'App',
///  );
///
/// static const versionCode = '1.0.0';
/// ```
///
/// And to check the configuration in the other code like this:
///
/// ```dart
/// Text(AppConfig.emailCS.value) // when use flavor add (.value) is the end
/// Text(AppConfig.versionCode) // when not use flavor
///
/// ```
class AppConfig {
  const AppConfig._();

  /// {{ appName }}
  static const appName = FlavorConfig<String>(
    dev: '[DEV] {{ appName }}',
    stag: '[STG] {{ appName }}',
    prod: '{{ appName }}',
  );

  /// {{ appName }} for Firebase Options
  static const firebaseAppName = FlavorConfig<String>(
    dev: 'DevAppName',
    stag: 'StgAppName',
    prod: 'AppName',
  );

  /// App Banner Name
  static const appBannerName = FlavorConfig<String>(
    dev: '[DEV]',
    stag: '[STAG]',
    prod: '',
  );

  /// FirebaeOptions
  static final firebaseOptions = FlavorConfig<FirebaseOptions>(
    dev: dev.DefaultFirebaseOptions.currentPlatform,
    stag: stg.DefaultFirebaseOptions.currentPlatform,
    prod: DefaultFirebaseOptions.currentPlatform,
  );
}
