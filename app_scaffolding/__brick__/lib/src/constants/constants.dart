// * themes
export '../app/themes/themes.dart';

// * keys
export 'keys/extras_key.dart';
export 'keys/hive_key.dart';

// * enums
export 'enums/enums.dart';

import 'dart:ui';

class AppConstants {
  const AppConstants._();

  // config
  static const env = 'ENV';
  static const envDev = 'DEV';
  static const envStg = 'STG';
  static const envProd = 'PROD';

  // translation
  static const translationsAssetPath = 'assets/translations';
  static const id = 'id';
  static const en = 'en';
  static const localeID = Locale(id, 'ID');
  static const localeEN = Locale(en, 'US');
  static const langID = 'lang_ID';
  static const langEN = 'lang_EN';
}
