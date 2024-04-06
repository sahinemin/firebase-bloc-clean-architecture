import 'package:flutter/material.dart';

extension SizeExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get statusBarHeight => mediaQuery.padding.top;
  double get bottomBarHeight => mediaQuery.padding.bottom;
  Size get size => mediaQuery.size;
  double get toolbarHeight => kToolbarHeight;
  double get height => size.height;
  double get width => size.width;
}
