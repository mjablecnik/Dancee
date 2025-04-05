import '../../../dancee_design_exports.dart';
import 'package:flutter/material.dart';


class AccordionTheme {
  static final light = AccordionStyle(
    headerColor: Colors.white,
    headerPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
    headerTextStyle: TextStyle(fontWeight: FontWeight.w600),
    bodyColor: Colors.white,
    bodyPadding: const EdgeInsets.only(left: 8, right: 8, bottom: 12, top: 0),
    bodyTextStyle: TextStyle(),
    iconColor: Colors.black54,
    borderColor: Color(0xffe6e6e6),
  );

  static final dark = light;
}