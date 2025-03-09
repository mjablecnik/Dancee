import 'package:dancee_design/design/elements/buttons/link_button/link_button.style.dart' show LinkButtonStyle;
import 'package:flutter/material.dart';


class LinkButton extends StatelessWidget {
  const LinkButton({
    super.key,
    required this.text,
    this.padding,
    this.icon,
    this.leadingIcon = true,
    this.onTap,
    this.style,
  });

  final String text;

  final IconData? icon;
  final EdgeInsets? padding;
  final bool leadingIcon;
  final GestureTapCallback? onTap;
  final LinkButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;

    return TextButton.icon(
      onPressed: onTap,
      icon: icon == null ? null : Icon(icon, size: currentStyle.iconSize, color: currentStyle.iconColor),
      iconAlignment: leadingIcon ? IconAlignment.start : IconAlignment.end,
      style: TextButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.transparent,
        overlayColor: Colors.transparent,
        padding: padding ?? EdgeInsets.zero,
      ),
      label: Text(
        text,
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: currentStyle.fontWeight,
          fontSize: currentStyle.textSize,
          color: currentStyle.textColor,
          decoration: TextDecoration.underline,
          decorationColor: currentStyle.textColor,
          letterSpacing: 0.1,
        ),
      ),
    );
  }
}
