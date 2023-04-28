import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as p;

void run(HookContext context) async {
  final appLink = context.vars['appLink'];
  final devAppLink = context.vars['devAppLink'];
  final stgAppLink = context.vars['stgAppLink'];

  final sha256 = context.vars['sha256'];
  final devSha256 = context.vars['devSha256'];
  final stgSha256 = context.vars['stgSha256'];

  final appleTeamId = context.vars['appleTeamId'];

  // Build.gradle
  var filePath = p.join(Directory.current.path, 'android/app', 'build.gradle');
  File file = File(filePath);
  String fileContent = await file.readAsString();

  String newFileContent = fileContent.replaceAll(r'appLink', appLink);
  newFileContent = newFileContent.replaceAll(r'devAppLink', devAppLink);
  newFileContent = newFileContent.replaceAll(r'stgAppLink', stgAppLink);

  await file.writeAsString(newFileContent);

  // assetlinks.json
  var assetlinksPath =
      p.join(Directory.current.path, 'android', 'assetlinks.json');
  File assetLinksFile = File(assetlinksPath);
  String assetLinksContent = await assetLinksFile.readAsString();

  String newAssetLinksContent = assetLinksContent.replaceAll(r'sha256', sha256);
  newAssetLinksContent =
      newAssetLinksContent.replaceAll(r'devSha256', devSha256);
  newAssetLinksContent =
      newAssetLinksContent.replaceAll(r'stgSha256', stgSha256);

  await assetLinksFile.writeAsString(newAssetLinksContent);

  // apple-app-site-association
  var siteAssocPath =
      p.join(Directory.current.path, 'ios', 'apple-app-site-association');
  File siteAssocFile = File(siteAssocPath);
  String siteAssocContent = await siteAssocFile.readAsString();

  String newSiteAssocContent =
      siteAssocContent.replaceAll(r'appleTeamId', appleTeamId);

  await siteAssocFile.writeAsString(newSiteAssocContent);
}
