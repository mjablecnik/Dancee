import 'package:serinus/serinus.dart';


class {{name.pascalCase()}}Service extends Provider {
  {{name.pascalCase()}}Service();

  String getName(String name) {
    return "Hello $name!!";
  }
}
