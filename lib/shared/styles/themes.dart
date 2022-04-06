import 'package:flutter/material.dart';
import 'package:store/shared/styles/colors.dart';

class appTheme {
  static ThemeData defaulTheme = ThemeData(
    scaffoldBackgroundColor: appColors.bgLightColor,

    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 18.0,
        color: appColors.darkColor,
      )
    ),

    appBarTheme: const AppBarTheme(
      color: appColors.lightColor,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: appColors.darkColor
      )
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: appColors.secondColor,
    )

  );
}