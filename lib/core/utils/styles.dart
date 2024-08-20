import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/core/utils/colors.dart';
import 'package:whatsapp_messenger/core/utils/size_config.dart';

abstract class Styles {
  static TextStyle styleRegular16(BuildContext context) => TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w400,
      color: SizeConfig.isLight ? kgreyLight : kgreyDark);

  static TextStyle styleMedium16(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w500,
        color: SizeConfig.isLight ? kgreyLight : kgreyDark,
      );

  static TextStyle styleMedium18(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontWeight: FontWeight.w500,
      );
  static TextStyle styleSemiBold20(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.w600,
      );
  static TextStyle styleBold20(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.w700,
      );

  static TextStyle styleExtraBold24(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 24),
        fontWeight: FontWeight.w800,
      );
}
//1- get scale factor
//2- responsive font size
//3- min max limit

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return width / 400;
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;
  double responsiveFontSize = fontSize * getScaleFactor(context);
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}
