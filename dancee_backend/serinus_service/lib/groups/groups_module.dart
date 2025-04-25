import 'package:dancee_shared/clients/surrealdb_client.dart';
import 'package:serinus/serinus.dart';
import 'package:serinus_service/groups/groups_controller.dart';
import 'package:serinus_service/groups/groups_repository.dart';

class GroupsModule extends Module {
  GroupsModule()
    : super(
        imports: [],
        controllers: [GroupsController()],
        providers: [
          Provider.deferred(
            () async => GroupsRepository(await SurrealDbClient.init()),
            inject: [],
            type: GroupsRepository,
          ),
        ],
      );
}
