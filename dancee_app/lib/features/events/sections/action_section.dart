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
        border: Border.symmetric(horizontal: BorderSide(color: AppColors.grey400.withAlpha(25))),
      ),
      child: Row(
        children: [
          LinkButton(
            text: "Filtrovat",
            icon: Icon(CupertinoIcons.slider_horizontal_3, size: 14, color: AppColors.blue900),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          ),
          Spacer(),
          LinkButton(
            text: "Přidat událost",
            icon: Icon(Icons.add, color: AppColors.blue900, size: 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          ),
        ],
      ),
    );
  }
}
