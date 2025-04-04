import 'package:flutter/material.dart';
import 'label.style.dart';

class Label extends StatelessWidget {
  const Label({super.key, required this.text, this.icon, this.style});

  final String text;
  final Widget? icon;
  final LabelStyle? style;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;

    if (icon != null) {
      return Row(
        spacing: 8,
        children: [
          icon ?? SizedBox.shrink(),
          Text(text, style: currentStyle.textStyle),
        ],
      );
    } else {
      return Text(text, style: currentStyle.textStyle);
    }
  }
}
