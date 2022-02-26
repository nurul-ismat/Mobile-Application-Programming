import 'package:flutter/material.dart';

import '../screens/home/home_screen.dart';

class Routes {
  static const String homeRoute = '/home';

  static Route<dynamic> createRoute(settings) {
    switch (settings.name) {
      case homeRoute:
        return HomeScreen.route();
    }
    return null;
  }
}
