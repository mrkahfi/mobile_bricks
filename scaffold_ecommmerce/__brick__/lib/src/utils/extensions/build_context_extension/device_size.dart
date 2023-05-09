import 'package:flutter/material.dart';

extension BuildContextEntension<T> on BuildContext {
  bool get isMobile => MediaQuery.of(this).size.width <= 500;

  bool get isTablet =>
      MediaQuery.of(this).size.width < 1024 &&
      MediaQuery.of(this).size.width >= 650;

  bool get isSmallTablet =>
      MediaQuery.of(this).size.width < 650 &&
      MediaQuery.of(this).size.width > 500;

  bool get isDesktop => MediaQuery.of(this).size.width >= 1024;

  bool get isSmall =>
      MediaQuery.of(this).size.width < 850 &&
      MediaQuery.of(this).size.width >= 560;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  Size get size => MediaQuery.of(this).size;
}
