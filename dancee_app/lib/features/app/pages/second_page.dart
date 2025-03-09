import 'package:dancee_design/dancee_design.dart';
import 'package:flutter/material.dart';
import 'package:vader_app/vader_app.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "Second page",
      child: Center(
        child: PrimaryButton(
          text: "Go back",
          size: ButtonSize.medium,
          onTap: context.pop,
        ),
      ),
    );
  }
}
