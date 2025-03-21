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
//endregion


accordionStory(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Accordion(
        title: 'Bachata Dominicana Workshop',
        text: 'Open Level (bez úplných začátečníků—musíte znát základní kroky bachaty, základní otočky a základní změny směru).',
      ),
      Accordion(
        title: 'UrbanKiz Workshop',
        text: 'Open Level (bez úplných začátečníků—musíte znát základní kroky a saidu).',
      ),
      Accordion(
        title: 'Salsa + Bachata party',
        text: 'Žádné informace',
      ),
      Accordion(
        title: 'UrbanKiz + Zouk party',
        text: 'Žádné informace',
      ),
    ],
  );
}
