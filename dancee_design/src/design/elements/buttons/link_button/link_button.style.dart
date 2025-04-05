import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

@tailorMixinComponent
class LinkButtonStyle {
  const LinkButtonStyle({
    required this.textStyle,
  });

  @override
  final TextStyle textStyle;
}
