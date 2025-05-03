import 'package:dancee_shared/clients/surrealdb_client.dart' hide Middleware;
import 'package:serinus/serinus.dart';
import 'package:serinus_service/groups/groups_module.dart';
import 'package:serinus_service/vader_server.dart';
import 'package:vader_core/vader_core.dart';

Future<void> main(List<String> arguments) async {
  await VaderServer(modules: [AppModule(), GroupsModule()]).run();
}

class AppModule extends VaderModule {

  Injector? _injector;

  @override
  Injector? get services {
    if (_injector != null) return _injector;

    _injector = Injector();
    _injector!.addLazyInstance<SurrealDB>(SurrealDbClient.init());
    _injector!.commit();
    return _injector!;
  }

  @override
  List<Controller> get controllers => [];

  @override
  List<Middleware> get middlewares => [];
}
