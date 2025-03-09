import 'package:dancee_design/dancee_design.dart';
import 'package:flutter/material.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "Event detail",
      child: Center(
        child: Text("Event detail"),
      ),
    );
  }
}
