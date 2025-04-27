import 'package:dancee_app/features/app/app_module.dart';
import 'package:dancee_app/features/events/event_module.dart';
import 'package:dancee_app/features/events/event_repository.dart';
import 'package:vader_app/vader_app_tester.dart';
import 'package:vader_app/vader_app.dart';
import 'package:test/test.dart';

Future<void> main() async {
  await VaderAppTester(modules: [AppModule(), EventModule()]).init();
  final eventRepository = injector.use<EventRepository>();

  //test('Select all events', () async {
  //  await eventRepository.getAllEvents();
  //});
}
