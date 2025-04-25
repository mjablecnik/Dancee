import 'package:dancee_shared/clients/surrealdb_client.dart';
import 'package:serinus/serinus.dart';
import 'package:serinus_service/core/client_factory.dart';
import 'package:serinus_service/event/event_controller.dart';
import 'package:serinus_service/event/repositories/event_repository.dart';
import 'package:serinus_service/event/repositories/venue_repository.dart';
import 'package:serinus_service/event/services/event_service.dart';
import 'package:serinus_service/event/services/venue_service.dart';

class EventModule extends Module {
  EventModule()
    : super(
        controllers: [EventController()],
        providers: [
          Provider.deferred(
            () async => EventService(
              EventRepository(aiClient: AiClient(), surrealDB: await SurrealDbClient.init()),
              VenueService(VenueRepository(aiClient: AiClient(), surrealDB: await SurrealDbClient.init())),
            ),
            inject: [],
            type: EventService,
          ),
        ],
      );
}
