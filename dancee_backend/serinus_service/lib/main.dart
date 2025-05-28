import 'package:serinus_service/core/core_module.dart';
import 'package:serinus_service/event/event_module.dart';
import 'package:serinus_service/groups/groups_module.dart';
import 'package:serinus_service/vader_server.dart';

Future<void> main(List<String> arguments) async {
  await VaderServer(modules: [AppModule(), GroupsModule(), EventModule()]).run();
}
