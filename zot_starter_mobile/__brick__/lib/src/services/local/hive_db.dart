import 'package:hive_flutter/hive_flutter.dart';
import 'package:zot_starter/src/constants/constants.dart';

class HiveDB {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<String>(HiveKey.userBox);
    await Hive.openBox<String>(HiveKey.userTokenBox);
    await Hive.openBox<String>(HiveKey.emailBox);
    await Hive.openBox<String>(HiveKey.passwordBox);
  }

  Future<void> close() async {
    await Hive.close();
  }
}
