import 'package:flutter/widgets.dart';

class SizeConfig {
  static late double deviceWidth;
  static late double deviceHeight;
  static late double safeAreaHorizontal;
  static late double safeAreaVertical;

  static void init(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    deviceWidth = mediaQuery.size.width;
    deviceHeight = mediaQuery.size.height;
    safeAreaHorizontal = mediaQuery.padding.left + mediaQuery.padding.right;
    safeAreaVertical = mediaQuery.padding.top + mediaQuery.padding.bottom;
  }
}
