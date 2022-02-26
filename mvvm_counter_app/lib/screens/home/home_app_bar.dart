import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    print('Build HomeAppBar');

    return AppBar(
      title: Text('Flutter Demo Home Page'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
