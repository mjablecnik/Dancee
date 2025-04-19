import 'package:serinus/serinus.dart';
import 'package:hotreloader/hotreloader.dart';
import 'package:serinus_service/event/event_controller.dart';
import 'package:serinus_service/event/event_repository.dart';
import 'package:serinus_service/event/event_service.dart';

Future<void> main(List<String> arguments) async {
  String flavor = const String.fromEnvironment('FLAVOR', defaultValue: 'devel');
  if (flavor == 'devel') await HotReloader.create(debounceInterval: Duration(milliseconds: 300));

  final app = await serinus.createApplication(entrypoint: AppModule(), host: '0.0.0.0', port: 8000);
  await app.serve();
}

class AppModule extends Module {
  AppModule()
    : super(
        imports: [],
        controllers: [EventController()],
        providers: [
          EventService(EventRepository()),
        ],
      );
}
