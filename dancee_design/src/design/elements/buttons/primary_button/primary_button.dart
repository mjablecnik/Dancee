import '../../../../dancee_design_exports.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.size,
    this.icon,
    this.leadingIcon = true,
    this.onTap,
    this.style,
  });

  final String text;
  final ButtonSize size;
  final IconData? icon;
  final bool leadingIcon;
  final GestureTapCallback? onTap;
  final PrimaryButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;

    final (:buttonSize, :textStyle, :borderRadius) = ButtonUtils.resolveBySize(size);

    final buttonIcon =
        icon == null
            ? null
            : switch (size) {
              ButtonSize.small => Icon(icon, size: 18),
              ButtonSize.medium => Icon(icon, size: 22),
              ButtonSize.large => Icon(icon, size: 22),
            };

    return SizedBox(
      width: buttonSize.width,
      height: buttonSize.height,
      child: ElevatedButton.icon(
        iconAlignment: leadingIcon ? IconAlignment.start : IconAlignment.end,
        icon: buttonIcon,
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: currentStyle.color,
          foregroundColor: currentStyle.textStyle.color,
          textStyle: textStyle,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          elevation: 0,
          iconColor: currentStyle.iconColor,
        ),
        label: Text(text),
      ),
    );
  }
}
