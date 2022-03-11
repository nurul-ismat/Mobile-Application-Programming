import 'package:flutter/material.dart';

import 'app/dependencies.dart' as di;
import 'app/router.dart' as router;

void main() {
  di.init();

  runApp(
    MaterialApp(
      title: 'MVVM Setup',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: router.loginRoute,
      onGenerateRoute: router.createRoute,
    ),
  );
}
