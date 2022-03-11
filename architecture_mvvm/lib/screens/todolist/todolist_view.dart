import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view.dart';
import 'todolist_viewmodel.dart';
import '../login/login_viewmodel.dart';
import '../../app/dependencies.dart';
import 'widgets/appbar_view.dart';
import 'widgets/todo_view.dart';

class TodolistScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => TodolistScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarView(),
      body: SelectorView<TodolistViewmodel, int>(
        initViewmodel: (todolistViewmodel) =>
            todolistViewmodel.user = dependency<LoginViewmodel>().user,
        selector: (_, todolistViewmodel) =>
            todolistViewmodel.busy ? 0 : todolistViewmodel.todos.length,
        builder: (context, todolistViewmodel, __) {
          print('-' * 20);

          final todos = todolistViewmodel.todos;

          return ListView.separated(
            itemCount: todos.length,
            separatorBuilder: (context, index) => Divider(
              color: Colors.blueGrey,
            ),
            itemBuilder: (context, index) => TodoView(index: index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => dependency<TodolistViewmodel>().addNewTodo(),
      ),
    );
  }
}
