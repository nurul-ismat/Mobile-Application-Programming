import 'dart:math';

import 'package:flutter/material.dart';
import 'package:setup_mvvm/models/number.dart';

import '../view.dart';
import 'home_viewmodel.dart';
import 'number_list_tile.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SelectorView<HomeViewmodel, int>(
        selector: (_, vm) => vm.dataCount,
        builder: (_, vm, __, ___) {
          print('Build ListView');

          return ListView.separated(
            itemCount: vm.dataCount,
            separatorBuilder: (_, __) => Divider(),
            itemBuilder: (_, index) => NumberListTile(index),
          );
        },
      ),
    );
  }
}
