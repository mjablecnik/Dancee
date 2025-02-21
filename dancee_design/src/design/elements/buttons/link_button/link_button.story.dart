import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dancee_design/dancee_design.dart';
import 'package:storybook_toolkit/storybook_toolkit.dart';

//region Knobs
String textKnob(BuildContext context) => context.knobs.text(label: 'Button text', initial: 'Default text');

bool iconKnob(BuildContext context) => context.knobs.boolean(label: 'Show icon', initial: false);

String textKnobOptions(BuildContext context) => context.knobs.options(
      label: 'Button text',
      initial: 'Default text',
      options: [
        const Option(label: "Short text", value: "Short text"),
        const Option(label: "Long text", value: "Vítejte zde na našich stránkách."),
      ],
    );

onTap() => debugPrint("Test click.");
//endregion

linkButtonStory(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 30,
    children: [
      LinkButton(
        text: "Přidat další informace",
        onTap: onTap,
      ),
      LinkButton(
        text: "Resetovat vše",
        onTap: onTap,
        style: context.designTheme.elementsStyle.buttonsStyle.linkButtonStyle.copyWith(textSize: 14),
      ),
      LinkButton(
        text: "Přidat událost",
        onTap: onTap,
        icon: iconKnob(context) ? Icons.add : null,
        leadingIcon: true,
      ),
      LinkButton(
        text: "Detail",
        onTap: onTap,
        leadingIcon: false,
        icon: iconKnob(context) ? CupertinoIcons.chevron_right : null,
        style: context.designTheme.elementsStyle.buttonsStyle.linkButtonStyle.copyWith(
          iconSize: 20,
          textSize: 13,
          iconColor: DesignColors.black,
          textColor: DesignColors.grey400,
          fontWeight: FontWeight.w400,
        ),
      ),
      LinkButton(
        text: "Upravit",
        onTap: onTap,
        icon: iconKnob(context) ? Icons.add : null,
        style: context.designTheme.elementsStyle.buttonsStyle.linkButtonStyle.copyWith(iconSize: 12, textSize: 12),
      ),
    ],
  );
}
