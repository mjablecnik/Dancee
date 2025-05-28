import 'package:dancee_shared/entities.dart';
import 'package:serinus/serinus.dart';
import 'package:hotreloader/hotreloader.dart';
import 'package:vader_core/vader_core.dart';

final Injector injector = Injector();

class VaderServer {
  const VaderServer({required this.modules, this.isDebug = false});

  final List<VaderModule> modules;

  final bool isDebug;

  run() async {
    String flavor = const String.fromEnvironment('FLAVOR', defaultValue: 'devel');
    if (flavor == 'devel') await HotReloader.create(debounceInterval: Duration(milliseconds: 300));

    final List<Module> serinusModules = [];

    for (VaderModule module in modules) {
      final services = module.services;
      injector.addInjector(services ?? Injector());
      serinusModules.add(_SerinusModule(controllers: module.controllers, middlewares: module.middlewares));
    }
    injector.commit();
    await Future.delayed(Duration(seconds: 1));

    final app = await serinus.createApplication(
      entrypoint: _SerinusApp(modules: serinusModules),
      host: '0.0.0.0',
      port: 8000,
    );
    app.use(CorsHook());
    await app.serve();
  }
}

abstract class VaderModule {
  bool isReady = false;
  //abstract final List<RouteBase> routes;
  abstract final List<Controller> controllers;
  abstract final List<Middleware> middlewares;
  abstract final Injector? services;
}

class _SerinusModule extends Module {
  _SerinusModule({
    List<Controller> controllers = const [],
    List<Middleware> middlewares = const [],
    List<Module> modules = const [],
  }) : super(controllers: controllers, middlewares: middlewares, imports: modules, token: Uuid().v4());
}

class _SerinusApp extends Module {
  _SerinusApp({
    List<Module> modules = const [],
  }) : super(imports: modules);
}
