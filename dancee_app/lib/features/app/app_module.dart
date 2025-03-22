import 'package:dancee_app/config.dart';
import 'package:dancee_app/features/app/clients/surrealdb_client.dart';
import 'package:dancee_app/features/app/pages/error_page.dart';
import 'package:dancee_app/features/app/pages/initial_page.dart';
import 'package:surrealdb/surrealdb.dart';
import 'package:vader_app/vader_app.dart';

class AppModule extends VaderModule {
  @override
  List<RouteBase> get routes => [$initialRoute, $errorRoute];

  @override
  Injector? get services {
    final injector = Injector();
    final appConfig = AppConfig();
    injector.addInstance(appConfig);
    injector.addLazyInstance<SurrealDB>(SurrealDbClient.init(appConfig.surrealDb));
    return injector;
  }
}
