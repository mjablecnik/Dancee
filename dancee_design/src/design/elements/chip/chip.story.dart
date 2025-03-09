import 'package:flutter/material.dart' hide Chip;
import '../../../dancee_design_exports.dart';
import 'package:storybook_toolkit/storybook_toolkit.dart';


//region Knobs
String textKnobOptions(BuildContext context) => context.knobs.options(
      label: 'Chip text',
      initial: 'Default text',
      options: [
        const Option(label: "Zouk", value: "Zouk"),
        const Option(label: "Salsa", value: "Salsa"),
        const Option(label: "Bachata", value: "Bachata"),
        const Option(label: "Kizomba", value: "Kizomba"),
        const Option(label: "Swing", value: "Swing"),
      ],
    );

onTap() => debugPrint("Test click.");
//endregion


chipStory(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 30,
    children: [
      Chip(
        text: textKnobOptions(context),
      ),
    ],
  );
}
