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
    this.textStyle,
  });

  final String text;

  final Widget? icon;
  final EdgeInsets? padding;
  final bool leadingIcon;
  final GestureTapCallback? onTap;
  final LinkButtonStyle? style;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;

    return TextButton.icon(
      onPressed: onTap,
      icon: icon ?? const SizedBox.shrink(),
      iconAlignment: leadingIcon ? IconAlignment.start : IconAlignment.end,
      style: TextButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.transparent,
        overlayColor: Colors.transparent,
        padding: padding ?? EdgeInsets.zero,
      ),
      label: Text(text, style: textStyle ?? currentStyle.textStyle),
    );
  }
}
