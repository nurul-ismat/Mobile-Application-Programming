import '../../models/todo.dart';

abstract class TodoService {
  Future<List<Todo>> getUserTodoList({int userId});
  Future<Todo> updateTodoStatus({int id, bool status});
  Future<Todo> createTodo({Todo todo});
  Future deleteTodo({int id});
}
