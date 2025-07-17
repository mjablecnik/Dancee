import 'package:flutter/cupertino.dart';

import '../../../../dancee_design_exports.dart';
import 'package:flutter/material.dart';

class DropDownFieldTheme {
  static final light = DropDownFieldStyle(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.grey400.withAlpha(128), width: 1.25),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.grey400.withAlpha(128), width: 1.25),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.grey400.withAlpha(128), width: 1.25),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    hintStyle: TextStyles.dropdownTextStyle,
    textStyle: TextStyles.dropdownTextStyle,
    dropdownColor: AppColors.white,
  );

  static final dark = light;
}