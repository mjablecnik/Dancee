import 'package:dancee_shared/entities/event.dart';
import 'package:serinus/serinus.dart';
import 'package:serinus_service/event/enums.dart';
import 'package:serinus_service/event/event_repository.dart';
import 'package:vader_core/clients/logger.dart';

class EventService extends Provider {
  const EventService(this.eventRepository);
  final EventRepository eventRepository;

  Future<Event> getEvent(String url) async {
    final Event event = await eventRepository.getFbEvent(url);
    final EventType eventType = await eventRepository.getEventType(event);

    if (![EventType.party, EventType.workshop, EventType.festival].contains(eventType)) {
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
}
