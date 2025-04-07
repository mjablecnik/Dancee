import 'package:serinus/serinus.dart';
import 'package:serinus_service/todo/todo.dart';

import 'todo_service.dart';

class TodoController extends Controller {
  TodoController({super.path = '/'}) {
    on(Route.get('/'), _getAllTodos);
    on(Route.get('/<index>'), _getTodo);
    on(Route.post('/'), _createTodo);
    on(Route.put('/<index>'), _toggleTodo);
    on(Route.delete('/<index>'), _removeTodo);
  }

  Future<List<Todo>> _getAllTodos(RequestContext context) async {
    return context.use<TodoService>().todos;
  }

  Future<Todo> _getTodo(RequestContext context) async {
    final index = int.tryParse(context.params['index'] ?? '');
    if (index == null) {
      throw BadRequestException(message: 'Invalid index');
    }
    final todos = context.use<TodoService>().todos;
    if (todos.isEmpty || index < 0 || index >= todos.length) {
      throw NotFoundException(message: 'Todo not found');
    }
    return todos[index];
  }

  Future<Todo> _toggleTodo(RequestContext context) async {
    final index = int.tryParse(context.params['index'] ?? '');
    if (index == null) {
      throw BadRequestException(message: 'Invalid index');
    }
    context.use<TodoService>().toggleTodoStatus(index);
    return context.use<TodoService>().todos[index];
  }

  Future<Todo> _createTodo(RequestContext context) async {
    final body = context.body.json;
    if (body?.multiple == true) {
      throw BadRequestException(message: 'Invalid request body');
    }
    if (body == null || body.value['title'] == null) {
      throw BadRequestException(message: 'Invalid request body');
    }
    final title = body.value['title'] as String;
    context.use<TodoService>().addTodo(title);
    return context.use<TodoService>().todos.last;
  }

  Future<void> _removeTodo(RequestContext context) async {
    final index = int.tryParse(context.params['index'] ?? '');
    if (index == null) {
      throw BadRequestException(message: 'Invalid index');
    }
    context.use<TodoService>().removeTodoAt(index);
  }
}
