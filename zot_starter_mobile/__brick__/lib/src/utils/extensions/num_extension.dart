import 'package:flutter/widgets.dart';

extension XNum on num {
  SizedBox get gapH {
    return SizedBox(
      height: this as double,
    );
  }
}
