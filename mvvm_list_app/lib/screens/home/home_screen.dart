import 'package:flutter/material.dart';

import 'home_app_bar.dart';
import 'home_body.dart';
import 'home_float.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: HomeBody(),
      floatingActionButton: HomeFloat(),
    );
  }
}
