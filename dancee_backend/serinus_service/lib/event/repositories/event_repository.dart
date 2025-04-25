import 'package:dancee_shared/clients/surrealdb_client.dart';
import 'package:dancee_shared/entities.dart';
import 'package:serinus/serinus.dart';
import 'package:serinus_service/event/enums.dart';
import 'package:serinus_service/core/client_factory.dart';
import 'package:vader_core/clients/logger.dart';

import '../event_queries.dart';

class EventRepository extends Provider {
  const EventRepository({required this.aiClient, required this.surrealDB});

  final IAiClient aiClient;
  final SurrealDB surrealDB;


  Future<EventType> getEventType(Event event) async {
    final result = await aiClient.query(
      rules: EventQuery.eventTypeRules,
      question: event.originalDescription,
      queryName: 'getEventType',
    );
    try {
      return EventType.values.byName(result["type"]);
    } catch (e) {
      logger.warning("Result type is: $result");
      return EventType.other;
    }
  }

  Future<({String description, List<EventPart> eventParts})> getEventParts(Event event) async {
    final result = await aiClient.query(
      rules: EventQuery.eventPartsRules,
      question: event.originalDescription,
      queryName: 'getEventParts',
    );
    final List<EventPart> eventParts = [];
    for (final e in result["event_parts"]) {
      eventParts.add(
        EventPart(
          name: e["name"],
          type: EventPartType.values.byName(e["type"]),
          dateTimeRange: DateTimeRange(
            start: DateTime.parse(e["date_time_range"]["start"]),
            end: DateTime.parse(e["date_time_range"]["end"]),
          ),
          description: e["description"],
          dances: [...e["dances"]],
          lectors: [...e["lectors"]],
          djs: [...e["djs"]],
        ),
      );
    }
    return (description: result['description'] as String, eventParts: eventParts);
  }

  Future<List<EventInfo>> getEventInfo(Event event) async {
    final result = await aiClient.query(
      rules: EventQuery.eventInfoRules,
      question: event.originalDescription,
      queryName: 'getEventInfo',
    );
    final List<EventInfo> eventInfo = [];
    for (final e in result["event_info"]) {
      if (e["value"] != null && e["value"] != "") {
        eventInfo.add(
          EventInfo(
            type: EventInfoType.values.byName(e["type"]),
            key: e["key"],
            value: e["value"],
          ),
        );
      }
    }
    return eventInfo;
  }

  /*
  Future<Event?> selectEvent(Event event) async {
    final events = (await surrealDB.query(
      r'SELECT *, venue.* FROM events WHERE original_url = $original_url FETCH venues',
      {'original_url': event.originalUrl},
    ) as List).first['result'] as List<dynamic>;

    print(events);
    if (events.length > 0) {
      return Event.fromSurrealQl(events.first);
    } else {
      return null;
    }
  }
  */

  Future<bool> existsEvent(Event event) async {
    final events = (await surrealDB.query(
      r'SELECT *, venue.* FROM events WHERE original_url = $original_url FETCH venues',
      {'original_url': event.originalUrl},
    ) as List).first['result'] as List<dynamic>;

    return events.length > 0;
  }

  Future<bool> saveEvent(Event event) async {
    print(event.toSurrealQl());
    try {
      await surrealDB.create('events', event.toSurrealQl());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
