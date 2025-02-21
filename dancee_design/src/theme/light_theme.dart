import 'package:dancee_design/constants/colors.dart';
import 'package:flutter/material.dart';

/*
  ThemeData and DesignTheme MUST be getters due to dynamic change during hot-reload!!
 */
ThemeData get lightTheme => ThemeData(
  brightness: Brightness.light,
  // removes splash effect
  splashFactory: NoSplash.splashFactory,
  // removes color when holding the button
  highlightColor: Colors.transparent,

  colorScheme: ColorScheme.light(
    //primary: DesignColors.red500,
    //border: DesignColors.blue600,
    surface: DesignColors.grey200,
  ),
  //textTheme: TextTheme(),
  appBarTheme: AppBarTheme(
    color: DesignColors.white,
    surfaceTintColor: DesignColors.white,
  ),
  extensions: [lightDesignThemeExtension],
);

get lightDesignThemeExtension {}
