import 'package:dancee_design/dancee_design.dart';
import 'package:flutter/material.dart';
import 'package:storybook_toolkit/storybook_toolkit.dart';
import 'package:vader_design/vader_design.dart';

final List<Story> assetIcons = [
  Story(
    tags: const ['assets', 'icons'],
    name: 'Assets/Icons',
    goldenPathBuilder: (c) => goldenTestPathBuilder(c),
    builder: (BuildContext context) {
      const spacing = 8.0;
      return Padding(
        padding: const EdgeInsets.all(spacing),
        child: Column(
          spacing: spacing,
          children: [
            ...AppIcons.values.map(
              (e) => SizedBox(
                width: 140,
                child: Row(spacing: spacing, children: [e.svg, Spacer(), SizedBox(width: 100, child: Text(e.name))]),
              ),
            ),
          ],
        ),
      );
    },
  ),
];
