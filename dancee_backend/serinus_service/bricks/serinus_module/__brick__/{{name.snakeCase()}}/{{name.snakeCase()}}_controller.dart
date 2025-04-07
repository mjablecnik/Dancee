import 'package:serinus/serinus.dart';

import '{{name.snakeCase()}}_service.dart';

class {{name.pascalCase()}}Controller extends Controller {
  {{name.pascalCase()}}Controller({super.path = '/'}) {
    on(Route.get('/hello'), _sayHello);
  }

  Future<String> _sayHello(RequestContext context) async {
    final name = context.query["name"] ?? "World";
    return context.use<{{name.pascalCase()}}Service>().getName(name);
  }
}
