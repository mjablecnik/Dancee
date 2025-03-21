import 'package:flutter/material.dart';
import 'accordion.style.dart';

class Accordion extends StatefulWidget {
  const Accordion({
    super.key,
    required this.title,
    required this.text,
    this.isOpen = false,
    this.onTap,
    this.style,
  });

  final String title;
  final String text;
  final bool isOpen;
  final GestureTapCallback? onTap;
  final AccordionStyle? style;

  @override
  State<Accordion> createState() => _AccordionTileState();
}

class _AccordionTileState extends State<Accordion> {
  bool isOpen = false;

  @override
  void initState() {
    isOpen = widget.isOpen ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentStyle = widget.style!;

    final header = GestureDetector(
      onTap: () => setState(() => isOpen = !isOpen),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          border: const Border(top: BorderSide(width: 1, color: Color(0xffe6e6e6))),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.title),
            Icon(
              isOpen ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined,
              color: Colors.black54,
            ),
          ],
        ),
      ),
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
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            color: Colors.white,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(widget.text)]),
          ),
        ],
      ),
    );
  }
}
