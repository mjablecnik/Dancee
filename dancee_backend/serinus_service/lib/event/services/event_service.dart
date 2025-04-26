import 'package:dancee_shared/entities.dart';
import 'package:serinus/serinus.dart';
import 'package:serinus_service/core/client_factory.dart';
import 'package:serinus_service/core/error_service.dart';
import 'package:serinus_service/event/enums.dart';
import 'package:serinus_service/event/repositories/event_repository.dart';
import 'package:serinus_service/event/services/venue_service.dart';
import 'package:vader_core/clients/logger.dart';

class EventService extends Provider {
  const EventService(this.eventRepository, this.venueService, this.errorService);

  final EventRepository eventRepository;
  final VenueService venueService;
  final ErrorService errorService;

  Future<Event> getEvent(String url) async {
    logger.info("Downloading: $url");
    final Event event = await getEventFromFacebook(url);
    final EventType eventType = await eventRepository.getEventType(event);

    if (![EventType.party, EventType.workshop, EventType.festival, EventType.holiday].contains(eventType)) {
      logger.debug('Event type is: $eventType');
      throw Exception('Event type \'$eventType\' is not supported');
    } else {
      logger.debug('Event type is: $eventType');

      final (:description, :eventParts) = await eventRepository.getEventParts(event);
      final List<EventInfo> eventInfo = await eventRepository.getEventInfo(event);

      final updatedEvent = event.copyWith(
        description: description,
        //originalDescription: '',
        parts: eventParts,
        info: eventInfo,
      );
      return updatedEvent;
    }
  }

  Future<Event> getEventFromFacebook(String url) async {
    final client = ClientFactory.fbServiceClient();
    final response = await client.get("/scrape/event?url=$url");

    final payload = response.data["payload"];
    final location = payload["location"];

    final event = Event(
      id: Uuid().v7(),
      title: payload['name'],
      venue: await venueService.createVenueByLocation(location),
      dateTimeRange: DateTimeRange(
        start: DateTime.fromMillisecondsSinceEpoch(payload["startTimestamp"] * 1000),
        end: () {
          try {
            return DateTime.fromMillisecondsSinceEpoch(payload["endTimestamp"] * 1000);
          } catch (e) {
            return DateTime.fromMillisecondsSinceEpoch(payload["startTimestamp"] * 1000);
          }
        }(),
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

  Future<List<dynamic>> getEventListUrlFromFacebook(String url) async {
    try {
      logger.info(url);
      final client = ClientFactory.fbServiceClient();
      final response = await client.get("/scrape/event/list?url=$url");

      final payload = response.data["payload"];
      return payload.map((e) => e["url"]).toList();
    } catch (e) {
      await errorService.createError(url, "Cannot obtain event list.");
      return [];
    }
  }

  Future<bool> createEvent(Event event) async {
    final venueRepository = venueService.venueRepository;
    final Venue? venueFromDB = await venueRepository.selectVenue(event.venue);

    if (venueFromDB == null) {
      await venueRepository.saveVenue(event.venue);
    } else {
      event = event.copyWith(venue: venueFromDB);
    }

    if (!await eventRepository.existsEvent(event)) {
      await eventRepository.saveEvent(event);
      return true;
    } else {
      return false;
    }
  }
}
