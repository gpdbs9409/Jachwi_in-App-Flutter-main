import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';


class SizeConfig {
  static late double deviceWidth;
  static late double deviceHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late double safeAreaHorizontal;
  static late double safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  static void init(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    deviceWidth = mediaQueryData.size.width;
    deviceHeight = mediaQueryData.size.height;
    blockSizeHorizontal = deviceWidth / 100;
    blockSizeVertical = deviceHeight / 100;

    safeAreaHorizontal = mediaQueryData.padding.left + mediaQueryData.padding.right;
    safeAreaVertical = mediaQueryData.padding.top + mediaQueryData.padding.bottom;
    safeBlockHorizontal = (deviceWidth - safeAreaHorizontal) / 100;
    safeBlockVertical = (deviceHeight - safeAreaVertical) / 100;
  }
}


