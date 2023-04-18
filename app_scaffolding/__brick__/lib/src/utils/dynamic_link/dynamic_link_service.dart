import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DynamicLinkService {
  DynamicLinkService({required this.dynamicLinks});

  final FirebaseDynamicLinks dynamicLinks;

  Future<String?> get initialLink async {
    try {
      final deepLink = await dynamicLinks.getInitialLink();
      return deepLink?.link.path;
    } catch (e) {
      return null;
    }
  }

  Stream<PendingDynamicLinkData> get dynamicLinkStream {
    return dynamicLinks.onLink;
  }
}

final firebaseDynamicLinksProvider = Provider<FirebaseDynamicLinks>(
  (ref) => FirebaseDynamicLinks.instance,
);

final dynamicLinkServiceProvider = Provider<DynamicLinkService>(
  (ref) => DynamicLinkService(
    dynamicLinks: ref.watch(firebaseDynamicLinksProvider),
  ),
);
