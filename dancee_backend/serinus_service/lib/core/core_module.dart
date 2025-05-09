import 'package:dancee_shared/clients/surrealdb_client.dart' hide Middleware;
import 'package:serinus/serinus.dart';
import 'package:serinus_service/core/client_factory.dart';
import 'package:serinus_service/core/error_service.dart';
import 'package:serinus_service/vader_server.dart';
import 'package:vader_core/vader_core.dart';


class AppModule extends VaderModule {

  Injector? _injector;

  @override
  Injector? get services {
    if (_injector != null) return _injector;

    _injector = Injector();
    _injector!.addSingleton(AiClient.new);
    _injector!.addLazyInstance<SurrealDB>(SurrealDbClient.init());
    _injector!.waitFor<SurrealDB>(() {
      _injector!.addSingleton(ErrorService.new);
    });

    return _injector!;
  }

  @override
  List<Controller> get controllers => [];

  @override
  List<Middleware> get middlewares => [];
}
