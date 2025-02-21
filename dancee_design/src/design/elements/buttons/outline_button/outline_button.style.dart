import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

@tailorMixinComponent
class OutlineButtonStyle {
  const OutlineButtonStyle({
    required this.primaryColor,
    required this.secondaryColor,
    required this.iconColor,
    required this.textColor,
  });

  @override
  final Color primaryColor;

  @override
  final Color secondaryColor;

  @override
  final Color iconColor;

  @override
  final Color textColor;
}
