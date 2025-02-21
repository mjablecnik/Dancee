import 'package:dancee_design/dancee_design.dart';
import 'package:flutter/material.dart';

class PrimaryButtonTheme {
  static final light = PrimaryButtonStyle(
    color: DesignColors.blue600,
    iconColor: DesignColors.white,
    textStyle: ButtonTextStyles.largeButtonTextStyle.copyWith(color: DesignColors.white),
    borderRadius: BorderRadius.circular(10),
  );

  static final dark = light;
}
