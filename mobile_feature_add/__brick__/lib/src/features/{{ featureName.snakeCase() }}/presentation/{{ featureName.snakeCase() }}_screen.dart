import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zog_ui/zog_ui.dart';

/// Screen that contains the bottom navigation bar along with the children tabs
class {{ featureName.pascalCase() }}Screen extends ConsumerWidget {
  /// Create [{{ featureName.pascalCase() }}Screen] object with a key
  const {{ featureName.pascalCase() }}Screen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Scaffold(
        appBar: ZeroAppBar(
          title: const Text('{{ featureName.titleCase() }}'),
        ),
        body: Container(),
      ),
    );
  }
}
