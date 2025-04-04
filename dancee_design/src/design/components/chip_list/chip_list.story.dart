import 'package:flutter/widgets.dart';
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

const chips = [
  Chip(text: 'Salsa'),
  Chip(text: 'Zouk'),
  Chip(text: 'Bachata'),
  Chip(text: 'Kizomba'),
];
//endregion

chipListStory(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 30,
    children: [
      ChipList(
        chips: chips,
        width: 400,
      ),
      ChipList(
        chips: chips,
        width: 200,
        style: ChipListStyle(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.grey400.withAlpha(30),
            ),
          ),
        ),
      ),
      ChipList(
        chips: chips,
        width: 200,
        padding: EdgeInsets.symmetric(vertical: 8),
        style: ChipListStyle(
          decoration: BoxDecoration(
            color: AppColors.blue200,
          ),
        ),
      ),
    ],
  );
}
