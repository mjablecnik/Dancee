import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

@tailorMixinComponent
class PageLayoutStyle {
  const PageLayoutStyle({
    required this.toolbarHeight,
    required this.backgroundColor,
    required this.headerColor,
  });

  @override
  final double toolbarHeight;

  @override
  final Color backgroundColor;

  @override
  final Color headerColor;
}
