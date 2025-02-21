import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

@tailorMixinComponent
class LinkButtonStyle {
  const LinkButtonStyle({
    required this.iconSize,
    required this.iconColor,
    required this.textSize,
    required this.textColor,
    required this.fontWeight,
  });

  @override
  final double iconSize;

  @override
  final Color iconColor;

  @override
  final double textSize;

  @override
  final Color textColor;

  @override
  final FontWeight fontWeight;
}
