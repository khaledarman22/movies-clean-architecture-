import 'package:flutter/Material.dart';

extension MediaQueryValues on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get safeBlockHorizontal =>
      screenWidth -
      MediaQuery.of(this).padding.left +
      MediaQuery.of(this).padding.right;
  double get safeBlockVertical =>
      screenHeight -
      MediaQuery.of(this).padding.top +
      MediaQuery.of(this).padding.bottom;
}
