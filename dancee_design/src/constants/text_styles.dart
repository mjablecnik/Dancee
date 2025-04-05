import 'package:dancee_design/constants/assets.dart';
import 'package:dancee_design/constants/colors.dart';
import 'package:flutter/material.dart';

class ButtonTextStyles {
  static const TextStyle largeButtonTextStyle = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
  );

  static const TextStyle mediumButtonTextStyle = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
  );

  static const TextStyle smallButtonTextStyle = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w600,
    fontSize: 12,
    letterSpacing: 0.4,
  );
}

class LinkTextStyles {
  static const TextStyle mediumLinkTextStyle = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w500,
    fontSize: 13,
    color: AppColors.blue900,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.blue900,
    letterSpacing: 0.1,
  );

  static const TextStyle smallLinkTextStyle = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: AppColors.blue600,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.blue600,
    letterSpacing: 0.1,
  );
}

class TextStyles {
  static const TextStyle largeTitleTextStyle = TextStyle(
    fontSize: 22,
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w600,
    height: 1.30,
  );

  static const TextStyle mediumTitleTextStyle = TextStyle(
    fontSize: 16,
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w600,
    height: 1.10,
  );

  static const TextStyle smallTitleTextStyle = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    fontSize: 14,
  );

  static const TextStyle smallBodyTextStyle = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.normal,
    fontSize: 11.5,
    letterSpacing: 0.1,
    color: AppColors.grey400,
  );

  static const TextStyle smallLabelTextStyle = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    fontSize: 12,
  );
}
