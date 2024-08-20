import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenHeight, screenWidth;
  static late bool isLight;
  static init(BuildContext context) {
    screenHeight = MediaQuery.sizeOf(context).height;
    screenWidth = MediaQuery.sizeOf(context).width;
    isLight =MediaQuery.of(context).platformBrightness == Brightness.light ? true : false;
  }
}
