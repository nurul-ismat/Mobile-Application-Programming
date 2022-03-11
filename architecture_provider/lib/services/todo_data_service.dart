import '../dependencies.dart';
import '../models/todo.dart';
import 'rest_service.dart';

class TodoDataService {
  final rest = service<RestService>();

  Future<List<Todo>> getTodoList() async {
    final listJson = await rest.get('todos');

    return (listJson as List)
        .map((itemJson) => Todo.fromJson(itemJson))
        .toList();
  }

  Future<Todo> updateTodoStatus({int id, bool status}) async {
    final json = await rest.patch('todos/$id', data: {'completed': status});
    return Todo.fromJson(json);
  }

  Future<Todo> createTodo({Todo todo}) async {
    final json = await rest.post('todos', data: todo);
    return Todo.fromJson(json);
  }

  Future deleteTodo({int id}) async {
    await rest.delete('todos/$id');
  }
}
