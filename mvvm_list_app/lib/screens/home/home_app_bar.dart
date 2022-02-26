import 'package:flutter/material.dart';
import 'package:setup_mvvm/screens/home/home_viewmodel.dart';

import '../view.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SelectorView<HomeViewmodel, int>(
          selector: (_, vm) => vm.dataCount,
          builder: (_, vm, __, ___) {
            print('Build App Bar');
            return Text('List App - ${vm.dataCount} items available');
          }),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
