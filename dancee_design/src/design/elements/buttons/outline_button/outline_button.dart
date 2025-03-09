import '../../../../dancee_design_exports.dart';
import 'package:flutter/material.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton({
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
  final OutlineButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;

    final (:buttonSize, :textStyle, :borderRadius) = ButtonUtils.resolveBySize(size);

    final buttonIcon =
        icon == null
            ? null
            : switch (size) {
              ButtonSize.small => Icon(icon, size: 18, color: currentStyle.iconColor),
              ButtonSize.medium => Icon(icon, size: 22, color: currentStyle.iconColor),
              ButtonSize.large => Icon(icon, size: 22, color: currentStyle.iconColor),
            };

    return SizedBox(
      width: buttonSize.width,
      height: buttonSize.height,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: buttonIcon,
        iconAlignment: leadingIcon ? IconAlignment.start : IconAlignment.end,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          side: BorderSide(width: size == ButtonSize.small ? 2.5 : 3, color: currentStyle.primaryColor),
          padding: EdgeInsets.zero,
          backgroundColor: currentStyle.secondaryColor,
          foregroundColor: currentStyle.primaryColor,
          textStyle: textStyle,
          elevation: 0,
        ),
        label: Text(text, style: textStyle.copyWith(color: currentStyle.textColor)),
      ),
    );
  }
}
