import 'package:dancee_design/design/design.theme.dart';
import 'package:dancee_design/theme/dark_theme.dart';
import 'package:dancee_design/theme/dark_theme_extension.dart';
import 'package:dancee_design/theme/light_theme.dart';
import 'package:dancee_design/theme/light_theme_extension.dart';
import 'package:flutter/material.dart';


class ExampleDesignTheme {
  static ThemeData get light => lightTheme;
  static ThemeData get dark => darkTheme;
}

class ExampleDesignThemeExtension {
  static DesignTheme get light => lightDesignThemeExtension;
  static DesignTheme get dark => darkDesignThemeExtension;
}
