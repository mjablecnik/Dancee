import '../../../../dancee_design_exports.dart';
import 'package:flutter/material.dart';

class PrimaryButtonTheme {
  static final light = PrimaryButtonStyle(
    color: AppColors.blue600,
    iconColor: AppColors.white,
    textStyle: ButtonTextStyles.largeButtonTextStyle.copyWith(color: AppColors.white),
    borderRadius: BorderRadius.circular(10),
  );

  static final dark = light;
}
