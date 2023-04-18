import 'dart:async';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{ packageName }}/src/utils/dynamic_link/dynamic_link_service.dart';

class DynamicLinkNotifier extends StateNotifier<Uri?> {
  DynamicLinkNotifier({
    required this.dynamicLinkService,
  }) : super(null) {
    _streamSubscription = dynamicLinkService.dynamicLinkStream.listen(
      (event) {
        state = event.link;
      },
    );
  }

  final DynamicLinkService dynamicLinkService;
  StreamSubscription<PendingDynamicLinkData>? _streamSubscription;

  Future<void> getInitialLink() async {
    final path = await dynamicLinkService.initialLink;
    state = Uri.parse(path.toString());
  }

  void clear() => state = null;

  @override
  void dispose() {
    _streamSubscription?.cancel();
    _streamSubscription = null;
    super.dispose();
  }
}

final dynamicLinkNotifierProvider =
    StateNotifierProvider<DynamicLinkNotifier, Uri?>(
  (ref) => DynamicLinkNotifier(
    dynamicLinkService: ref.watch(dynamicLinkServiceProvider),
  ),
);
