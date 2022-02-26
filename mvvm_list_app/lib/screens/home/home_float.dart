import 'dart:math';

import 'package:flutter/material.dart';

import '../../models/number.dart';
import '../view.dart';
import 'home_viewmodel.dart';

class HomeFloat extends StatelessWidget {
  const HomeFloat({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return View<HomeViewmodel>(
      shouldRebuild: false,
      builder: (_, vm, __) {
        print('Build HomeFloat + button');
        final a = Random();
        return FloatingActionButton(
          onPressed: () => vm.addItem(Number(a.nextInt(100))),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        );
      },
    );
  }
}
