import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

@tailorMixinComponent
class ChipStyle {
  const ChipStyle({
    required this.color,
    required this.textStyle,
  });

  @override
  final Color color;

  @override
  final TextStyle textStyle;
}
