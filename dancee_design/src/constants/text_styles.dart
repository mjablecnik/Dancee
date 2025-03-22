import 'package:dancee_design/constants/colors.dart';
import 'package:flutter/material.dart';

class TextFonts {
  static const String inter = 'Inter';
}

class ButtonTextStyles {
  static const TextStyle largeButtonTextStyle = TextStyle(
    fontFamily: TextFonts.inter,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
  );

  static const TextStyle mediumButtonTextStyle = TextStyle(
    fontFamily: TextFonts.inter,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
  );

  static const TextStyle smallButtonTextStyle = TextStyle(
    fontFamily: TextFonts.inter,
    fontWeight: FontWeight.w600,
    fontSize: 12,
    letterSpacing: 0.4,
  );
}

class TextStyles {
  static const TextStyle smallTitleTextStyle = TextStyle(
    fontFamily: TextFonts.inter,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    fontSize: 14,
  );

  static const TextStyle smallBodyTextStyle = TextStyle(
    fontFamily: TextFonts.inter,
    fontWeight: FontWeight.normal,
    fontSize: 11.5,
    letterSpacing: 0.1,
    color: DesignColors.grey400,
  );

  static const TextStyle smallLabelTextStyle = TextStyle(
    fontFamily: TextFonts.inter,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    fontSize: 12,
  );
}
