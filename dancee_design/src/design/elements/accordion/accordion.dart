import 'package:flutter/material.dart';
import 'accordion.style.dart';

class Accordion extends StatefulWidget {
  const Accordion({
    super.key,
    this.title,
    this.content,
    this.isOpen = false,
    this.openingDuration = const Duration(milliseconds: 250),
    this.header,
    this.body,
    this.style,
  });

  final String? title;
  final String? content;
  final bool isOpen;
  final Duration openingDuration;
  final Widget? header;
  final Widget? body;
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
      duration: widget.openingDuration,
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
            child: widget.body ?? Text(widget.content!, style: currentStyle.bodyTextStyle),
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
          widget.header ?? Text(widget.title!, style: currentStyle.headerTextStyle),
          Icon(
            isOpen ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined,
            color: currentStyle.iconColor,
          ),
        ],
      ),
    );
  }
}
