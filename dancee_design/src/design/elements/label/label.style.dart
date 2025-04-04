import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

@tailorMixinComponent
class LabelStyle {
  const LabelStyle({
    required this.textStyle,
  });

  @override
  final TextStyle textStyle;
}
