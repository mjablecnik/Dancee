import 'package:dancee_design/dancee_design.dart';
import 'package:dancee_app/features/events/logic/event_list_cubit.dart';
import 'package:dancee_app/features/events/logic/event_list_state.dart';
import 'package:dancee_shared/entities/event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Chip;
import 'package:vader_app/vader_app.dart';
import 'package:dancee_app/i18n/translations.g.dart';

import 'event_detail_page.dart';

part 'event_list_page.g.dart';

@TypedGoRoute<EventListRoute>(path: '/event/list')
class EventListRoute extends GoRouteData {
  const EventListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const EventListPage();
}

class EventListPage extends StatelessWidget {
  const EventListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: i18n.events.list.title,
      child: Column(
        children: [
          ActionSection(),
          BlocBuilder<EventListCubit, EventListState>(
            bloc: injector.use<EventListCubit>(),
            builder: (context, state) {
              return state.when(
                loading: () => Text(i18n.events.list.loading),
                failed: (e) => Text("${i18n.events.list.error}: $e"),
                loaded: (events) => Expanded(child: EventList(events: events)),
              );
            },
          ),
        ],
      ),
    );
  }
}

class EventList extends StatelessWidget {
  const EventList({super.key, required this.events});

  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return EventCard(
          width: double.infinity,
          title: event.title,
          place: event.venue!.name,
          since: event.dateTimeRange.start,
          until: event.dateTimeRange.end,
          style: EventCardStyle(decoration: BoxDecoration(color: index % 2 == 0 ? AppColors.white : AppColors.blue200)),
          tooMuchInfo: event.tags.length >= 3 && event.title.length > 24,
          chips: event.tags.map((t) => Chip(text: t)).toList(),
          onTap: () async {
            //await injector.use<EventRepository>().getAllEvents();
            EventDetailRoute(event).push(context);
          },
        );
      },
    );
  }
}

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
            text: i18n.events.list.actions.filter,
            icon: Icon(CupertinoIcons.slider_horizontal_3, size: 14, color: AppColors.blue900),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          ),
          Spacer(),
          LinkButton(
            text: i18n.events.list.actions.add,
            icon: Icon(Icons.add, color: AppColors.blue900, size: 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          ),
        ],
      ),
    );
  }
}
