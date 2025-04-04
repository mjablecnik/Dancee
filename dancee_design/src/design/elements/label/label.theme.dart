import '../../../dancee_design_exports.dart';
import 'package:flutter/material.dart';

class LabelTheme {
  static final light = LabelStyle(
    textStyle: TextStyle(
      fontFamily: AppFonts.inter,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.1,
      fontSize: 12,
      color: AppColors.grey400,
    ),
  );

  static final dark = light;
}
