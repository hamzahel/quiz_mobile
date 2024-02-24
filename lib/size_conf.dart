import "package:flutter/material.dart";

class SizeConf {
  static MediaQueryData _mediaQueryData = _mediaQueryData;
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double defaultSize = 0;
  static Orientation orientation = Orientation.landscape;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConf.screenHeight;
  // 812 is the layout height that designer use
  if (screenHeight != 0) {
    return (inputHeight / 812) * screenHeight;
  } else {
    return (inputHeight);
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConf.screenWidth;
  if (screenWidth != 0) {
    return (inputWidth / 375) * screenWidth;
  } else {
    return (inputWidth);
  }
}
