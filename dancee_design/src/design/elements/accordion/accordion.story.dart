import 'package:flutter/material.dart';
import 'package:storybook_toolkit/storybook_toolkit.dart';

import '../../../dancee_design_exports.dart';


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


accordionStory(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Accordion(
        title: 'Sekce 1',
        text: 'Obsah Sekce 1',
        onTap: onTap,
      ),
      Accordion(
        title: 'Sekce 2',
        text: 'Obsah Sekce 2',
        onTap: onTap,
      ),
      Accordion(
        title: 'Sekce 3',
        text: 'Obsah Sekce 3',
        onTap: onTap,
      ),
    ],
  );
}
