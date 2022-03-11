import '../../app/dependencies.dart';

import '../../services/todo/todo_service.dart';
import '../../models/todo.dart';
import '../../models/user.dart';
import '../viewmodel.dart';

// The todo list is user-specific
class TodolistViewmodel extends Viewmodel {
  List<Todo> todos;
  User _user;

  User get user => _user;
  set user(User user) {
    _user = user;
    getList();
  }

  TodolistViewmodel();
  TodoService get dataService => dependency();

  Future<void> getList() async {
    if (user == null) return;
    turnBusy();
    todos = await dataService.getUserTodoList(userId: user.id);
    turnIdle();
  }

  Future<void> addNewTodo() async {
    turnBusy();
    final newTodo = await dataService.createTodo(
        todo: Todo(title: 'New task', userId: user.id));
    todos.add(newTodo);
    turnIdle();
  }

  Future<void> removeTodo(int index) async {
    turnBusy();
    await dataService.deleteTodo(id: todos[index].id);
    todos.removeAt(index);
    turnIdle();
  }

  Future<void> toggleTodoStatus(int index) async {
    turnBusy();
    final updatedTodo = await dataService.updateTodoStatus(
        id: todos[index].id, status: !todos[index].completed);
    todos[index].completed = updatedTodo.completed;
    turnIdle();
  }
}
