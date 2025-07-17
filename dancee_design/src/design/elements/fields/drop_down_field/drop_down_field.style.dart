import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

@tailorMixinComponent
class DropDownFieldStyle {
  const DropDownFieldStyle({
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.contentPadding,
    this.hintStyle,
    this.textStyle,
    this.dropdownColor,
  });

  @override
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Color? dropdownColor;
}
