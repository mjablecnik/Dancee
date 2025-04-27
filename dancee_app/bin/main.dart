import 'package:dancee_app/features/events/event_repository.dart';

main() async {
  final eventRepository = EventRepository();
  final events = await eventRepository.getEvents();
  print(events);
}
