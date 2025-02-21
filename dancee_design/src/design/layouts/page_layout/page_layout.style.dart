import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

@tailorMixinComponent
class PageLayoutStyle {
  const PageLayoutStyle({
    required this.toolbarHeight,
  });

  @override
  final double toolbarHeight;
}
