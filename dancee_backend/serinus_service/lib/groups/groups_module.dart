import 'package:dancee_shared/clients/surrealdb_client.dart' hide Middleware;
import 'package:serinus/serinus.dart';
import 'package:serinus_service/core/core_module.dart';
import 'package:serinus_service/groups/groups_controller.dart';
import 'package:serinus_service/groups/groups_repository.dart';
import 'package:vader_core/vader_core.dart';

class GroupsModule extends AppModule {
  Injector? get services {
    final services = super.services!;
    services.waitFor<SurrealDB>(() {
      services.addSingleton(GroupsRepository.new);
    });
    return services;
  }

  @override
  List<Controller> get controllers => [GroupsController()];

  @override
  List<Middleware> get middlewares => [];
}
