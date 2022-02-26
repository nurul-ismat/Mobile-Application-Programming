import 'package:flutter/material.dart';
import 'package:setup_mvvm/screens/home/home_screen.dart';

import 'app/dependencies.dart' as di;

void main() {
  di.init();

  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: HomeScreen(),
  ));
}
