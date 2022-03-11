import 'package:flutter/material.dart';

import 'screens/todo_list_screen.dart';
import 'dependencies.dart' as di;

void main() {
  di.init();

  runApp(
    MaterialApp(
      title: 'Provider',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: TodoListScreen(),
    ),
  );
}
