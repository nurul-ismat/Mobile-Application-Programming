import 'package:flutter/material.dart';

import 'app/dependencies.dart' as di;
import 'app/routes.dart';

void main() {
  di.init();

  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    initialRoute: Routes.homeRoute,
    onGenerateRoute: Routes.createRoute,
  ));
}
