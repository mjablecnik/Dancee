import 'package:serinus/serinus.dart';
import 'package:serinus_service/todo/todo_controller.dart';
import 'package:serinus_service/todo/todo_service.dart';

class TodoModule extends Module {
  TodoModule() : super(
    imports: [],
    controllers: [
      TodoController()
    ],
    providers: [
      TodoService()
    ],
  );
}