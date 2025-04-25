import 'package:dancee_shared/clients/surrealdb_client.dart';
import 'package:serinus/serinus.dart';
import 'package:hotreloader/hotreloader.dart';
import 'package:serinus_service/core/client_factory.dart';
import 'package:serinus_service/event/event_controller.dart';
import 'package:serinus_service/event/repositories/event_repository.dart';
import 'package:serinus_service/event/services/event_service.dart';

import 'event/repositories/venue_repository.dart';
import 'event/services/venue_service.dart';

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
          AiClient(),
          Provider.deferred(() => SurrealDbClient.initDancee(), inject: [], type: SurrealDB),

          Provider.deferred(
            (aiClient, surrealDB) async => EventService(
              EventRepository(aiClient: aiClient, surrealDB: await SurrealDbClient.init()),
              VenueService(VenueRepository(aiClient: aiClient, surrealDB: await SurrealDbClient.init())),
            ),
            inject: [AiClient, SurrealDB],
            type: EventService,
          ),
        ],
      );
}
