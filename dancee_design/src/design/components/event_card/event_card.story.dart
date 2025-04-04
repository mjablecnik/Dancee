import 'package:flutter/widgets.dart';
import '../../../dancee_design_exports.dart';
import 'package:storybook_toolkit/storybook_toolkit.dart';

//region Knobs
String placeKnob(BuildContext context) => context.knobs.text(label: 'Place text', initial: 'Prostor Elementů');

bool iconKnob(BuildContext context) => context.knobs.boolean(label: 'Show icon', initial: false);

String textKnobOptions(BuildContext context) => context.knobs.options(
      label: 'Button text',
      initial: 'Bachata Winter Vibes',
      options: [
        const Option(label: "Short text", value: "Bachata Winter Vibes"),
        const Option(label: "Middle text", value: "Vánoční párty s Hanserem a Vilmou"),
        const Option(label: "Long text", value: "Bachata Winter Vibes a Salsa párty s Hanserem"),
        const Option(label: "Very Long text", value: "Bachata Winter Vibes a Salsa párty s Hanserem a Vilmou"),
      ],
    );

onTap() => debugPrint("Test click.");
//endregion

eventCardStory(BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: EventCard(
          title: textKnobOptions(context),
          place: placeKnob(context),
          since: DateTime(2025, 12, 10, 20, 0, 0),
          until: DateTime(2025, 12, 11, 1, 0, 0),
          onTap: onTap,
          style: EventCardStyle(
            decoration: BoxDecoration(
              color: AppColors.white,
            ),
          ),
          tooMuchInfo: true,
          chips: [
            Chip(text: 'Salsa'),
            Chip(text: 'Zouk'),
            Chip(text: 'Bachata'),
            Chip(text: 'Kizomba'),
          ],
        ),
      ),
    ],
  );
}

eventCardListStory(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 30,
    children: [
      Column(
        children: [
          EventCard(
            title: textKnobOptions(context),
            place: placeKnob(context),
            since: DateTime(2025, 12, 10, 20, 0, 0),
            until: DateTime(2025, 12, 11, 1, 0, 0),
            onTap: onTap,
            style: EventCardStyle(
              decoration: BoxDecoration(
                color: AppColors.white,
              ),
            ),
            tooMuchInfo: true,
            chips: [
              Chip(text: 'Salsa'),
              Chip(text: 'Zouk'),
              Chip(text: 'Bachata'),
              Chip(text: 'Kizomba'),
            ],
          ),
          EventCard(
            title: textKnobOptions(context),
            place: placeKnob(context),
            since: DateTime(2025, 12, 10, 20, 0, 0),
            until: DateTime(2025, 12, 11, 1, 0, 0),
            onTap: onTap,
            chips: [
              Chip(text: 'Zouk'),
            ],
          ),
          EventCard(
            title: textKnobOptions(context),
            place: placeKnob(context),
            since: DateTime(2025, 12, 10, 20, 0, 0),
            until: DateTime(2025, 12, 11, 1, 0, 0),
            onTap: onTap,
            style: EventCardStyle(
              decoration: BoxDecoration(
                color: AppColors.white,
              ),
            ),
          ),
          EventCard(
            title: textKnobOptions(context),
            place: placeKnob(context),
            since: DateTime(2025, 12, 10, 20, 0, 0),
            until: DateTime(2025, 12, 11, 1, 0, 0),
            onTap: onTap,
            chips: [
              Chip(text: 'Salsa'),
              Chip(text: 'Bachata'),
            ],
          ),
        ],
      ),
    ],
  );
}
