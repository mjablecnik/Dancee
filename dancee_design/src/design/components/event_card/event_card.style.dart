import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

@tailorMixinComponent
class EventCardStyle {
  const EventCardStyle({
    required this.decoration,
  });

  @override
  final BoxDecoration decoration;
}
