import 'package:flutter/material.dart';
import 'accordion.style.dart';

class Accordion extends StatefulWidget {
  const Accordion({super.key, required this.title, required this.text, this.isOpen = false, this.style});

  final String title;
  final String text;
  final bool isOpen;
  final AccordionStyle? style;

  @override
  State<Accordion> createState() => _AccordionTileState();
}

class _AccordionTileState extends State<Accordion> {
  bool isOpen = false;

  @override
  void initState() {
    isOpen = widget.isOpen;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentStyle = widget.style!;

    final header = GestureDetector(
      onTap: () => setState(() => isOpen = !isOpen),
      child: _AccordionHeader(widget: widget, isOpen: isOpen),
    );

    return AnimatedCrossFade(
      crossFadeState: isOpen ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 250),
      firstChild: header,
      secondChild: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header,
          Container(
            width: double.infinity,
            padding: currentStyle.bodyPadding,
            color: currentStyle.bodyColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(widget.text, style: currentStyle.bodyTextStyle)],
            ),
          ),
        ],
      ),
    );
  }
}

class _AccordionHeader extends StatelessWidget {
  const _AccordionHeader({super.key, required this.widget, required this.isOpen});

  final Accordion widget;
  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    final currentStyle = widget.style!;

    return Container(
      padding: currentStyle.headerPadding,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 1, color: currentStyle.borderColor)),
        color: currentStyle.headerColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title, style: currentStyle.headerTextStyle),
          Icon(
            isOpen ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined,
            color: currentStyle.iconColor,
          ),
        ],
      ),
    );
  }
}
