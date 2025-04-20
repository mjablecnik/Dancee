import 'package:dancee_shared/entities.dart';
import 'package:serinus/serinus.dart';
import 'package:serinus_service/config.dart';
import 'package:serinus_service/event/enums.dart';
import 'package:serinus_service/core/client_factory.dart';
import 'package:vader_core/clients/logger.dart';
import 'package:google_geocoding_api/google_geocoding_api.dart';

import 'event_queries.dart';

class EventRepository extends Provider {
  const EventRepository();

  Future<Venue> getVenue(Map<String, dynamic> location) async {
    if (location['name'] != null &&
        location['address'] != null &&
        location['city'] != null &&
        location['countryCode'] != null) {
      return Venue(
        id: Uuid().v7(),
        name: location["name"],
        street: location["address"],
        number: '',
        town: location["city"]["name"],
        country: location["countryCode"],
        postalCode: '',
      );
    } else {
      final latitude = location['coordinates']['latitude'];
      final longitude = location['coordinates']['longitude'];

      final api = GoogleGeocodingApi(ServerConfig.googelApiKey, isLogged: false);
      final reversedSearchResults = await api.reverse('$latitude,$longitude', language: 'en');
      final address = reversedSearchResults.results.first.formattedAddress.split(', ');

      return Venue(
        id: Uuid().v7(),
        name: location["name"],
        street: address.first,
        number: '',
        town: address[1],
        country: address.last,
        postalCode: '',
      );
    }
  }

  Future<Event> getFbEvent(String url) async {
    final client = ClientFactory.fbServiceClient();
    final response = await client.get("/scrape/event?url=$url");

    final payload = response.data["payload"];
    final location = payload["location"];

    final event = Event(
      id: Uuid().v7(),
      title: payload['name'],
      venue: await getVenue(location),
      dateTimeRange: DateTimeRange(
        start: DateTime.fromMillisecondsSinceEpoch(payload["startTimestamp"] * 1000),
        end: DateTime.fromMillisecondsSinceEpoch(payload["endTimestamp"] * 1000),
      ),
      timezone: payload['timezone'],
      organizer: payload["hosts"].map((e) => e["name"]).join(" a "),
      originalDescription: payload["description"],
      description: "",
      originalUrl: payload["url"],
      info: [],
      parts: [],
    );

    return event;
  }

  Future<EventType> getEventType(Event event) async {
    final result = await AiClient.makeQuery(
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
    final result = await AiClient.makeQuery(
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
    final result = await AiClient.makeQuery(
      rules: EventQuery.eventInfoRules,
      question: event.originalDescription,
      queryName: 'getEventInfo',
    );
    print(result);
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
}
