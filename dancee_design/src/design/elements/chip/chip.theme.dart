import '../../../dancee_design_exports.dart';
import 'package:flutter/material.dart';


class ChipTheme {
  static final light = ChipStyle(
    color: Colors.blue,
    textStyle: TextStyle(
      fontFamily: 'Inter',
      color: DesignColors.grey700.withAlpha(210),
      fontWeight: FontWeight.w500,
      fontSize: 10,
    ),
  );

  static final dark = light;
}