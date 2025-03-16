import 'package:dancee_design/dancee_design.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Icons;

class ActionSection extends StatelessWidget {
  const ActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        border: Border.symmetric(horizontal: BorderSide(color: DesignColors.grey400.withAlpha(25))),
      ),
      child: Row(
        children: [
          LinkButton(
            text: "Filtrovat",
            icon: CupertinoIcons.slider_horizontal_3,
            style: context.designTheme.elementsStyle.buttonsStyle.linkButtonStyle.copyWith(iconSize: 14),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          ),
          Spacer(),
          LinkButton(
            text: "Přidat událost",
            icon: Icons.add,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          ),
        ],
      ),
    );
  }
}
