import 'package:flutter/material.dart';

import '../screens/login/login_view.dart';
import '../screens/todolist/todolist_view.dart';

const String homeRoute = '/login';
const String loginRoute = '/login';
const String todolistRoute = '/todolist';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case homeRoute:
    case loginRoute:
      return LoginScreen.route();
    case todolistRoute:
      return TodolistScreen.route();
  }
  return null;
}
