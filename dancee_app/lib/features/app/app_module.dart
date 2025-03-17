import 'package:dancee_app/config.dart';
import 'package:dancee_app/features/app/clients/surrealdb_client.dart';
import 'package:dancee_app/features/app/pages/initial_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:surrealdb/surrealdb.dart';
import 'package:vader_app/vader_app.dart';

class AppModule extends VaderModule {
  @override
  List<GoRoute> get routes => AppRoutes.routes;

  @override
  Injector? get services {
    final injector = Injector();
    final appConfig = AppConfig();
    injector.addInstance(appConfig);
    injector.addLazyInstance<SurrealDB>(SurrealDbClient.init(appConfig.surrealDb));
    return injector;
  }
}

enum AppRoutes {
  initial(InitialPage());

  const AppRoutes(Widget page) : _page = page;

  final Widget _page;

  static final routePath = '/app';

  get path => '$routePath/$name';

  static List<GoRoute> get routes => [Routes.route(routePath, AppRoutes.initial._page)];
}
