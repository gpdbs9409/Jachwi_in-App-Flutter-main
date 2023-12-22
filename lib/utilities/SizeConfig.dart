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
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    deviceWidth = _mediaQueryData.size.width;
    deviceHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = deviceWidth / 100;
    blockSizeVertical = deviceHeight / 100;

    safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (deviceWidth - safeAreaHorizontal) / 100;
    safeBlockVertical = (deviceHeight - safeAreaVertical) / 100;
  }
}


