import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/core/utils/colors.dart';

abstract class Themes {
  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
        scaffoldBackgroundColor: kbackgroundAndTextLight,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: kgreenLight,
          foregroundColor: kbackgroundAndTextLight,
          shadowColor: Colors.transparent,
          elevation: 0,
          splashFactory: NoSplash.splashFactory,
        )),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: kbackgroundAndTextLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
        ));
  }

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(  
        scaffoldBackgroundColor: kgreyBackground,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: kgreenDark,
          foregroundColor: kbackgroundAndTextDark,
          shadowColor: Colors.transparent,
          elevation: 0,
          splashFactory: NoSplash.splashFactory,
        )),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: kbackgroundAndTextDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
        ));
  }
}
