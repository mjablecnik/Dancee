import 'package:dancee_design/dancee_design.dart';
import 'package:dancee_app/features/events/event_list_cubit.dart';
import 'package:dancee_app/features/events/event_list_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:vader_app/vader_app.dart';

class EventListPage extends StatelessWidget {
  const EventListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "Seznam událostí",
      child: Column(
        children: [
          _ButtonSection(),
          BlocBuilder<EventListCubit, EventListState>(
            bloc: injector.use<EventListCubit>(),
            builder: (context, state) {
              return state.when(
                init: () => Text("Eventy se načítají"),
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
                          place: event.address.name,
                          since: event.since,
                          until: event.until,
                          style: EventCardStyle(
                            decoration: BoxDecoration(
                              color: index % 2 == 0 ? DesignColors.white : DesignColors.blue200,
                            ),
                          ),
                          tooMuchInfo: event.tags.length >= 3 && event.title.length > 24,
                          chips: event.tags.map((t) => Chip(text: t)).toList(),
                          onTap: () {
                            print("TODO: Go to Event detail page");
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

class _ButtonSection extends StatelessWidget {
  const _ButtonSection({super.key});

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
