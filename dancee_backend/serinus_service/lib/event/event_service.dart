import 'package:serinus/serinus.dart';
import 'package:serinus_service/event/enums.dart';
import 'package:serinus_service/event/event_repository.dart';
import 'package:vader_core/clients/logger.dart';

class EventService extends Provider {
  const EventService(this.eventRepository);
  final EventRepository eventRepository;

  Future<dynamic> getEvent(String url) async {
    final event = await eventRepository.getFbEvent(url);
    final eventType = await eventRepository.getEventType(event);
    if (![EventType.party, EventType.workshop, EventType.festival].contains(eventType)) {
      logger.info('Event type is: $eventType');
      return {'type': eventType};
    } else {
      logger.info('Event type is: $eventType');
      final updatedEvent = await eventRepository.updateEventInfo(event);
      return updatedEvent;
    }
  }
}
