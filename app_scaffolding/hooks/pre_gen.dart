import 'package:mason/mason.dart';

void run(HookContext context) {
  context.logger.info('''
Make sure you already created a Firebase project. 
If you don't, create one first https://console.firebase.google.com/u/0/
    ''');
}
