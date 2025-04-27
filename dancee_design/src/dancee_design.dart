import 'package:dancee_design/theme/dark_theme.dart';
import 'package:dancee_design/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:vader_design/vader_design.dart';

class DanceeTheme extends VaderTheme {
  @override
  Map<String, ThemeData> get themes => {'light': lightTheme, 'dark': lightTheme};
}
