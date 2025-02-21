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

pageLayoutStory(BuildContext context) {
  return PageLayout(
    title: "First page",
    child: Center(
      child: PrimaryButton(
        text: "Go to next page",
        size: ButtonSize.medium,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PageLayout(
                title: "Second page",
                child: Center(
                  child: PrimaryButton(
                    text: "Go back",
                    size: ButtonSize.medium,
                    onTap: Navigator.of(context).pop,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}
