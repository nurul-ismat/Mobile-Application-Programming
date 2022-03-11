import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../todolist_viewmodel.dart';
import '../../../app/dependencies.dart';

class TodoView extends StatelessWidget {
  final int index;
  TodoView({this.index});

  @override
  Widget build(BuildContext context) {
    return Selector<TodolistViewmodel, bool>(
      selector: (_, todolistViewmodel) => todolistViewmodel.busy
          ? null
          : todolistViewmodel.todos[index].completed,
      builder: (_, __, ___) {
        final todolistViewmodel = dependency<TodolistViewmodel>();
        final todo = todolistViewmodel.todos[index];

        // To show which ListTile gets rebuilt
        print('Build ListTile ${index + 1} - ${todo.completed}');

        return ListTile(
          title: Text(todo.title,
              style: TextStyle(
                  decoration: todo.completed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none)),
          subtitle: Text('id:  ${todo.id}'),
          onTap: () => todolistViewmodel.toggleTodoStatus(index),
          onLongPress: () => todolistViewmodel.removeTodo(index),
        );
      },
    );
  }
}
