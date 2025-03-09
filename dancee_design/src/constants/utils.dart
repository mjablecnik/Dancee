import '../dancee_design_exports.dart';
import 'package:flutter/material.dart';

enum ButtonSize { small, medium, large }

class Utils {
  static String truncateWithEllipsis(String text, int maxLength) {
    return (text.length > maxLength) ? '${text.substring(0, maxLength)}…' : text;
  }
}

class ButtonUtils {
  static ({Size buttonSize, TextStyle textStyle, BorderRadius borderRadius}) resolveBySize(ButtonSize size) {
    final buttonSize = switch (size) {
      ButtonSize.small => Size(132, 32),
      ButtonSize.medium => Size(165, 36),
      ButtonSize.large => Size(330, 42),
    };

    final textStyle = switch (size) {
      ButtonSize.small => ButtonTextStyles.smallButtonTextStyle,
      ButtonSize.medium => ButtonTextStyles.mediumButtonTextStyle,
      ButtonSize.large => ButtonTextStyles.largeButtonTextStyle,
    };

    final borderRadius = switch (size) {
      ButtonSize.small => BorderRadius.circular(6),
      ButtonSize.medium => BorderRadius.circular(6),
      ButtonSize.large => BorderRadius.circular(12),
    };

    return (buttonSize: buttonSize, textStyle: textStyle, borderRadius: borderRadius);
  }
}
