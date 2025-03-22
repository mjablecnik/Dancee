import 'package:flutter/material.dart';
import '../../../dancee_design_exports.dart';
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

eventDetailAccordionStory(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      EventDetailAccordion(
        time: "16:45",
        title: 'Bachata Dominicana Workshop',
        description:
            'Open Level (bez úplných začátečníků—musíte znát základní kroky bachaty, základní otočky a základní změny směru).',
        info: {"Lektoři": "Tom a Jolly", "Čas": "16:45 - 18:00"},
        isOpen: true,
      ),
      EventDetailAccordion(
        time: "16:45",
        title: 'UrbanKiz Workshop',
        description: 'Open Level (bez úplných začátečníků—musíte znát základní kroky a saidu).',
        info: {"Lektoři": "Vali a Kačul", "Čas": "16:45 - 18:00"},
      ),
      EventDetailAccordion(
        time: "18:00",
        title: 'Salsa + Bachata party',
        description: 'Žádné informace',
        info: {"DJ": "DJ Lusithano", "Čas": "18:00 - 22:00"},
      ),
      EventDetailAccordion(
        time: "18:00",
        title: 'UrbanKiz + Zouk party',
        description: 'Žádné informace',
        info: {"DJ": "Playlist", "Čas": "18:00 - 22:00"},
      ),
    ],
  );
}
