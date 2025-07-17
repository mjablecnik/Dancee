import 'package:flutter/material.dart';
import '../../../../dancee_design_exports.dart';
import 'package:storybook_toolkit/storybook_toolkit.dart';

//region Knobs
String hintTextKnob(BuildContext context) => context.knobs.text(label: 'Hint Text', initial: 'Select an item');

bool showIconKnob(BuildContext context) => context.knobs.boolean(label: 'Show custom icon', initial: false);

onChange(String value) => debugPrint("Item selected");
//endregion

Map<String, String> getItems() {
  return {'item1': 'Item 1', 'item2': 'Item 2', 'item3': 'Item 3'};
}

Widget dropDownFieldStory(BuildContext context) {
  final hintText = hintTextKnob(context);

  DropDownFieldStyle? customStyle;

  return DropDownField(initialValue: hintText, items: getItems(), onChange: onChange, style: customStyle);
}

Widget dropDownField2Story(BuildContext context) {
  return Container(
    width: 500,
    height: 300,
    color: AppColors.grey200,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        spacing: 16,
        children: [
          Text("Lokalita:", style: TextStyles.mediumTitleTextStyle.copyWith(fontWeight: FontWeight.w500)),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 260,
              child: DropDownField(
                initialValue: 'Celá republika',
                items: {'praha': 'Praha', 'brno': 'Brno', 'ostrava': 'Ostrava'},
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
