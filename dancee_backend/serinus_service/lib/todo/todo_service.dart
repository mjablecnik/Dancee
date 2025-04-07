import 'package:serinus/serinus.dart';
import 'package:serinus_service/todo/todo.dart';


class TodoService extends Provider {
  TodoService();

  List<Todo> todos = [];

  void addTodo(String name) {
    todos.add(Todo(
      title: name,
    ));
  }

  void toggleTodoStatus(int index) {
    todos[index] = todos[index].copyWith(isDone: !todos[index].isDone);
  }

  void removeTodoAt(int index) {
    todos.removeAt(index);
  }
}