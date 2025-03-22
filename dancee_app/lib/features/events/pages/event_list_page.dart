import 'package:dancee_app/entities/event.dart';
import 'package:dancee_app/entities/venue.dart';
import 'package:dancee_design/dancee_design.dart';
import 'package:dancee_app/features/events/logic/event_list_cubit.dart';
import 'package:dancee_app/features/events/logic/event_list_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';
import 'package:vader_app/vader_app.dart';
import 'package:dancee_app/i18n/translations.g.dart';

import '../sections/action_section.dart';
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
      title: i18n.events.title,
      child: Column(
        children: [
          ActionSection(),
          BlocBuilder<EventListCubit, EventListState>(
            bloc: injector.use<EventListCubit>(),
            builder: (context, state) {
              return state.when(
                loading: () => Text("Eventy se načítají"),
                failed: (e) => Text("Nastala chyba: $e"),
                loaded: (events) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        final event = events[index];
                        return EventCard(
                          width: double.infinity,
                          title: event.title,
                          place: event.venue.name,
                          since: event.since,
                          until: event.until,
                          style: EventCardStyle(
                            decoration: BoxDecoration(
                              color: index % 2 == 0 ? DesignColors.white : DesignColors.blue200,
                            ),
                          ),
                          tooMuchInfo: event.tags.length >= 3 && event.title.length > 24,
                          chips: event.tags.map((t) => Chip(text: t)).toList(),
                          onTap: () async {
                            //await injector.use<EventRepository>().getAllEvents();
                            EventDetailRoute(event).push(context);
                          },
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
final event1 = Event(
  id: Uuid().v7(),
  title: "Vánoční party s Hanserem a Vilmou",
  description:
  """Srdečně vás zveme na komorní vánoční párty!\nPřijďte si užít pohodový večer s Hanserem a Vilmou v příjemné atmosféře baru  Maracas. Tato akce je nejen pro naše studenty z kurzů, ale i pro  všechny, kdo si chtějí s námi dát drink, popovídat, zatančit a naladit  se na vánoční pohodu.""",
  venue: Venue(
    id: Uuid().v7(),
    name: "Café Bar Maracas124",
    street: "Nekázanka",
    number: "883/89",
    postalCode: "110 00",
    town: "Praha",
    country: "CZ",
  ),
  since: DateTime(2025, 12, 10, 20, 0, 0),
  until: DateTime(2025, 12, 11, 1, 0, 0),
  info: [
    EventInfo(type: EventInfoType.text, key: "Vstup", value: "Zdarma"),
    EventInfo(type: EventInfoType.text, key: "Šatna", value: "Zdarma"),
    EventInfo(type: EventInfoType.url, key: "Klub", value: "www.facebook.com/cafebar.maracas"),
    EventInfo(type: EventInfoType.url, key: "Odkaz", value: "https://fb.me/e/41aDcOTep"),
  ],
  organizer: "Salsaholics",
  parts: [
    EventPart(name: 'Workshop1', type: EventPartType.workshop, dances: ['Salsa'], lectors: [], djs: []),
    EventPart(name: 'Workshop2', type: EventPartType.workshop, dances: ['Bachata'], lectors: [], djs: []),
    EventPart(name: 'Party', type: EventPartType.party, dances: ['Salsa', 'Bachata'], lectors: [], djs: []),
  ],
);
