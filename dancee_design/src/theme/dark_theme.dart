import 'package:flutter/material.dart';

/*
  ThemeData and DesignTheme MUST be getters due to dynamic change during hot-reload!!
 */
ThemeData get darkTheme => ThemeData(
  brightness: Brightness.dark,
  // removes splash effect
  splashFactory: NoSplash.splashFactory,
  // removes color when holding the button
  highlightColor: Colors.transparent,

  colorScheme: const ColorScheme.dark(),
  extensions: [darkDesignThemeExtension],
);

get darkDesignThemeExtension {}
