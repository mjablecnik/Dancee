import 'package:dancee_design/dancee_design.dart';
import 'package:flutter/material.dart';


class EventCardTheme {
  static final light = EventCardStyle(
    decoration: BoxDecoration(
      color: DesignColors.blue200,
      border: Border.symmetric(
        horizontal: BorderSide(
          color: DesignColors.grey400.withAlpha(25),
        ),
      ),
    ),
  );

  static final dark = EventCardStyle(
    decoration: BoxDecoration(
      color: DesignColors.blue200,
      border: Border.symmetric(
        horizontal: BorderSide(
          color: DesignColors.grey400.withAlpha(25),
        ),
      ),
    ),
  );
}