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
        content:
            'Open Level (bez úplných začátečníků—musíte znát základní kroky bachaty, základní otočky a základní změny směru).',
      ),
      Accordion(
        title: 'UrbanKiz Workshop',
        content: 'Open Level (bez úplných začátečníků—musíte znát základní kroky a saidu).',
      ),
      Accordion(title: 'Salsa + Bachata party', content: 'Žádné informace'),
      Accordion(title: 'UrbanKiz + Zouk party', content: 'Žádné informace'),
    ],
  );
}

accordionCustomStory(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Accordion(
        header: Row(
          spacing: 8,
          children: [
            SizedBox(
              width: 50,
              child: Text('16:45', style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.1, fontSize: 14)),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width < 320 ? 180 : null,
              child: Wrap(
                children: [
                  Text(
                    'Bachata Dominicana Workshop',
                    style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.1, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Text(
              'Open Level (bez úplných začátečníků—musíte znát základní kroky bachaty, základní otočky a základní změny směru).',
              style: TextStyle(fontSize: 11.0, color: AppColors.grey400),
            ),
            Column(
              spacing: 6,
              children: [
                Row(
                  spacing: 12,
                  children: [
                    Text('Lektoři:', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600)),
                    Text('Tom a Jolly', style: TextStyle(fontSize: 12.0, color: AppColors.grey400)),
                  ],
                ),
                Row(
                  spacing: 12,
                  children: [
                    Text('Adresa:', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600)),
                    Text(
                      'Nekázanka 883/8,\n110 00 Praha, Česko',
                      style: TextStyle(fontSize: 12.0, color: AppColors.grey400),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        isOpen: true,
      ),
      Accordion(
        title: 'UrbanKiz Workshop',
        content: 'Open Level (bez úplných začátečníků—musíte znát základní kroky a saidu).',
      ),
      Accordion(title: 'Salsa + Bachata party', content: 'Žádné informace'),
      Accordion(title: 'UrbanKiz + Zouk party', content: 'Žádné informace'),
    ],
  );
}
