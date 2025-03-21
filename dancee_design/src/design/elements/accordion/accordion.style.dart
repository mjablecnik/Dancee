import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

@tailorMixinComponent
class AccordionStyle {
  const AccordionStyle({
    required this.headerColor,
    required this.headerTextStyle,
    required this.headerPadding,
    required this.bodyColor,
    required this.bodyTextStyle,
    required this.bodyPadding,
    required this.iconColor,
    required this.borderColor,
  });

  @override
  final Color headerColor;

  @override
  final TextStyle headerTextStyle;

  @override
  final EdgeInsets headerPadding;

  @override
  final Color bodyColor;

  @override
  final TextStyle bodyTextStyle;

  @override
  final EdgeInsets bodyPadding;

  @override
  final Color iconColor;

  @override
  final Color borderColor;
}
