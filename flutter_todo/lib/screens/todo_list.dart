//-----------------------------------------------------------
// Mobile Application Programming (SCSJ3623)
// Semester 2, 2019/2020
// Exercise 3: HTTP and JSON
//
// Name 1:  ......
// Name 2:  ......
//-----------------------------------------------------------

// TODO 1 - Toggle the status of the todo  when the user is pressing on the ListTile. This operation also updates the data on the server
// TODO 2 - Remove the todo  when the user is long-pressing on the ListTile. This operation also deletes the data from the server
// TODO 3 - Add a new todo  to the server when the user is pressing on the plus (+) button. The id for the newly created todo is given by the server

import 'package:exercise2/services/data_service.dart';
import 'package:flutter/material.dart';

import '../models/todo.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> _todos;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Todo>>(
        future: dataService.getTodoList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _todos = snapshot.data;
            return _buildMainScreen();
          }
          return _buildFetchingDataScreen();
        });
  }

  Scaffold _buildMainScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Todo List'),
      ),
      body: ListView.separated(
        itemCount: _todos.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.blueGrey,
        ),
        itemBuilder: (context, index) {
          final _todo = _todos[index];
          return ListTile(
            title: Text(_todo.title,
                style: TextStyle(
                    decoration: _todo.completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none)),
            subtitle: Text('id: ${_todo.id}'),
            onTap: () async {
              //Update the status at the database
              Todo updatedTodo = await dataService.updateTodoStatus(
                  id: _todos[index].id,
                  status: !_todos[index]
                      .completed); // Get the current status from UI and toggle it
              setState(() => _todos[index].completed = updatedTodo
                  .completed); // Update UI using the updated todo from database
            },
            onLongPress: () async {
              await dataService.deleteTodo(
                  id: _todos[index].id); // Delete todo at the database
              setState(() => _todos.removeAt(index)); // Update UI
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final newTodo = await dataService.createTodo(
            todo: Todo(title: 'New Task'),
          ); // Update server. Id for the new Todo will be given by the server

          setState(() => _todos.add(newTodo)); // Update UI
        },
      ),
    );
  }

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching todo... Please wait'),
          ],
        ),
      ),
    );
  }
}
