import 'package:flutter/material.dart';

import '../view.dart';
import 'home_viewmodel.dart';

class HomeFloat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return View<HomeViewmodel>(
      shouldRebuild: false,
      builder: (_, vm, __) {
        print('Build HomeFloat + button');
        return FloatingActionButton(
          onPressed: vm.incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        );
      },
    );
  }
}
