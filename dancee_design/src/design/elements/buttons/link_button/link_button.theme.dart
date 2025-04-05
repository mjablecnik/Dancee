import '../../../../dancee_design_exports.dart';
import 'package:flutter/material.dart';


class LinkButtonTheme {
  static final light = LinkButtonStyle(
    textStyle: TextStyle(
      fontFamily: AppFonts.inter,
      fontWeight: FontWeight.w500,
      fontSize: 13,
      color: AppColors.blue900,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.blue900,
      letterSpacing: 0.1,
    ),
  );

  static final dark = light;
}