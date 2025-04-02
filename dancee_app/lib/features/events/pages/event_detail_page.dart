import 'package:dancee_app/entities/event.dart';
import 'package:dancee_design/dancee_design.dart';
import 'package:flutter/material.dart';
import 'package:vader_app/vader_app.dart';

part 'event_detail_page.g.dart';

@TypedGoRoute<EventDetailRoute>(path: '/event/detail')
class EventDetailRoute extends GoRouteData {
  const EventDetailRoute(this.$extra);

  final Event $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) => EventDetailPage(event: $extra);
}

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "Detail události",
      child: Column(
        spacing: 20,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 140,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 20,
                  children: [
                    Text(event.title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, fontFamily: 'Inter')),
                    Text(event.description),
                  ],
                ),
              ),
            ),
          ),
          PrimaryButton(text: 'Zúčastním se', size: ButtonSize.large),
        ],
      ),
    );
  }
}
