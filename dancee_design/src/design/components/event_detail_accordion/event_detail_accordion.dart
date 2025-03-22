import 'package:flutter/material.dart';
import '../../../dancee_design_exports.dart';

class EventDetailAccordion extends StatelessWidget {
  const EventDetailAccordion({
    super.key,
    required this.time,
    required this.title,
    required this.description,
    this.isOpen = false,
    required this.info,
    this.style,
  });

  final String time;
  final String title;
  final String description;
  final bool isOpen;
  final Map<String, String> info;
  final EventDetailAccordionStyle? style;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;

    return Accordion(
      header: Row(
        spacing: 8,
        children: [
          SizedBox(
            width: 40,
            child: Text(time, style: TextStyles.smallTitleTextStyle),
          ),
          Text("-", style: TextStyles.smallTitleTextStyle),
          SizedBox(
            width: MediaQuery.of(context).size.width < 320 ? 180 : null,
            child: Wrap(children: [Text(title, style: TextStyles.smallTitleTextStyle)]),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Text(description, style: TextStyles.smallBodyTextStyle),
          Column(
            spacing: 6,
            children: [
              for (var i in info.entries)
                Row(
                  spacing: 12,
                  children: [
                    Text('${i.key}:', style: TextStyles.smallLabelTextStyle),
                    Text(i.value, style: TextStyles.smallBodyTextStyle),
                  ],
                ),
            ],
          ),
        ],
      ),
      isOpen: isOpen,
    );
  }
}
