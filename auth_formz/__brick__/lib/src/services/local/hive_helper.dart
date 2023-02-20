import 'package:hive_flutter/hive_flutter.dart';
import 'package:kickavenue/src/constants/constants.dart';

Future<void> hiveInit() async {
  await Hive.initFlutter();
  await Hive.openBox<String>(HiveKey.userBox);
  await Hive.openBox<String>(HiveKey.userTokenBox);
  await Hive.openBox<String>(HiveKey.firstInstallBox);
  await Hive.openBox<String>(HiveKey.emailBox);
  await Hive.openBox<String>(HiveKey.passwordBox);
}

Future<void> hiveClose() async {
  await Hive.close();
}
