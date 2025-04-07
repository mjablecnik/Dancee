import 'package:serinus/serinus.dart';
import 'package:{{package.snakeCase()}}/{{name.snakeCase()}}/{{name.snakeCase()}}_controller.dart';
import 'package:{{package.snakeCase()}}/{{name.snakeCase()}}/{{name.snakeCase()}}_service.dart';

class {{name.pascalCase()}}Module extends Module {
  {{name.pascalCase()}}Module() : super(
    imports: [],
    controllers: [{{name.pascalCase()}}Controller()],
    providers: [{{name.pascalCase()}}Service()],
  );
}
