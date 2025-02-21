import 'package:dancee_design/dancee_design.dart';
import 'package:flutter/material.dart' show Badge;
import 'package:flutter/widgets.dart';

class Chip extends StatelessWidget {
  const Chip({super.key, required this.text, this.style});

  final String text;
  final ChipStyle? style;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;

    return Badge(
      label: Text(text, style: currentStyle.textStyle),
      backgroundColor: DesignColors.blue200,
      textColor: currentStyle.textStyle.color,
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
    );
  }
}
