import 'package:dancee_design/constants/colors.dart';
import 'package:flutter/widgets.dart';
import '../../elements/chip/chip.dart';
import 'chip_list.style.dart';

class ChipList extends StatelessWidget {
  const ChipList({
    super.key,
    this.width = double.infinity,
    this.padding = const EdgeInsets.all(8.0),
    this.spacing = 6,
    required this.chips,
    this.style,
  });

  final double width;
  final EdgeInsets padding;
  final double spacing;
  final List<Chip> chips;
  final ChipListStyle? style;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;

    return Container(
      width: width,
      padding: padding,
      decoration: currentStyle.decoration,
      child: Wrap(spacing: spacing, runSpacing: spacing, children: chips),
    );
  }
}
