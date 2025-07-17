import 'package:dancee_app/features/events/logic/event_filtered_list_cubit.dart';
import 'package:dancee_design/dancee_design.dart';
import 'package:dancee_app/features/events/logic/event_list_state.dart';
import 'package:dancee_shared/entities/event.dart';
import 'package:dancee_shared/utils.dart';
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

class EventListPage extends StatefulWidget {
  const EventListPage({super.key});

  @override
  State<EventListPage> createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: i18n.events.list.title,
      child: Column(
        children: [
          //ActionSection(),
          Container(
            color: AppColors.grey200,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                spacing: 16,
                children: [
                  Text(
                    i18n.events.list.location,
                    style: TextStyles.mediumTitleTextStyle.copyWith(fontWeight: FontWeight.w500),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 260,
                      child: DropDownField(
                        initialValue: i18n.events.list.all,
                        items: Map.fromEntries(regionFilter.entries.map((e) => MapEntry(e.value, e.key))),
                        onChange: (value) {
                          injector.use<EventFilteredListCubit>().filterByRegion(value);
                          if (_scrollController.hasClients) _scrollController.jumpTo(0);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<EventFilteredListCubit, EventListState>(
              bloc: injector.use<EventFilteredListCubit>(),
              builder: (context, state) {
                return state.when(
                  loading: () => Center(child: Text(i18n.events.list.loading)),
                  failed: (e) => Center(child: Text("${i18n.events.list.error}: $e")),
                  loaded:
                      (events) =>
                          (events.isEmpty)
                              ? Center(child: Text(i18n.events.list.noEvents))
                              : EventList(events: events, controller: _scrollController),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class EventList extends StatelessWidget {
  const EventList({super.key, required this.events, this.controller});

  final List<Event> events;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return EventCard(
          width: double.infinity,
          title: event.title,
          place: event.venue!.name,
          since: event.dateTimeRange.start.toLocal(),
          until: event.dateTimeRange.end.toLocal(),
          style: EventCardStyle(decoration: BoxDecoration(color: index % 2 == 0 ? AppColors.white : AppColors.blue200)),
          tooMuchInfo: event.tags.length >= 3 && event.title.length > 24,
          chips: event.tags.take(4).map((t) => Chip(text: t)).toList(),
          weekDay: weekDays[event.dateTimeRange.start.weekday - 1],
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
