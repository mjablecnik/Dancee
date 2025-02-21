import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

@tailorMixinComponent
class ChipListStyle {
  const ChipListStyle({
    required this.decoration,
  });

  @override
  final BoxDecoration decoration;
}
