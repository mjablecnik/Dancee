import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

@tailorMixinComponent
class AccordionStyle {
  const AccordionStyle({
    required this.color,
  });

  @override
  final Color color;
}
