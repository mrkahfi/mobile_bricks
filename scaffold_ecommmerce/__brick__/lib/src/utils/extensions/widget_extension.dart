import 'package:flutter/material.dart';

const _kDefaultBodyPadding = 16.0;

extension XWidget on Widget {
  Widget get withDefaultPadding {
    return Padding(
      padding: const EdgeInsets.all(_kDefaultBodyPadding),
      child: this,
    );
  }
}
