import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as p;

void run(HookContext context) async {
  final appLink = context.vars['appLink'];
  final devAppLink = context.vars['devAppLink'];
  final stgAppLink = context.vars['stgAppLink'];

  var filePath = p.join(Directory.current.path, 'android/app', 'build.gradle');
  File file = File(filePath);
  String fileContent = await file.readAsString();

  String newFileContent = fileContent.replaceAll(r'{{ appLink }}', appLink);
  newFileContent = newFileContent.replaceAll(r'{{ devAppLink }}', devAppLink);
  newFileContent = newFileContent.replaceAll(r'{{ stgAppLink }}', stgAppLink);

  await file.writeAsString(newFileContent);
}
