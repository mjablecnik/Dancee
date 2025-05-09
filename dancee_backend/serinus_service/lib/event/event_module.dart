import 'package:dancee_shared/clients/surrealdb_client.dart' hide Middleware;
import 'package:serinus_service/event/repositories/event_repository.dart';
import 'package:serinus_service/event/repositories/venue_repository.dart';
import 'package:vader_core/vader_core.dart';
import 'package:serinus/serinus.dart';

import '../server.dart';
import 'event_controller.dart';
import 'services/event_service.dart';
import 'services/venue_service.dart';

class EventModule extends AppModule {
  Injector? get services {
    final services = super.services!;
    services.waitFor<SurrealDB>(() {
      services.addSingleton(EventRepository.new);
      services.addSingleton(VenueRepository.new);

      services.addSingleton(VenueService.new);
      services.addSingleton(EventService.new);
    });
    return services;
  }

  @override
  List<Controller> get controllers => [EventController()];

  @override
  List<Middleware> get middlewares => [];
}
