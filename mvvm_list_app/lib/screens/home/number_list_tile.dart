import 'dart:math';
import 'package:flutter/material.dart';

import '../../models/number.dart';
import 'home_viewmodel.dart';
import '../view.dart';

class NumberListTile extends StatelessWidget {
  final int _index;
  const NumberListTile(this._index);

  @override
  Widget build(BuildContext context) {
    final rnd = Random();

    return SelectorView<HomeViewmodel, Number>(
      selector: (_, vm) => vm.getItem(_index),
      builder: (_, vm, number, ___) {
        print('Build ListTile $_index');

        return ListTile(
          title: Text('${number.value}'),
          subtitle:
              Text('Tap to change number randomly and long pressed to delete'),
          // Delete an item on long press
          onLongPress: () => vm.deleteItem(_index),
          // Update to a new random number on tap
          onTap: () => vm.editItem(_index, Number(rnd.nextInt(200))),
        );
      },
    );
  }
}
