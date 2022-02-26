// TODO Complete this file. This class should receive data from the TaskListScreen. The UI structure has been provided.
//
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 4,
      separatorBuilder: (context, index) => Divider(
        color: Colors.blueGrey,
      ),
      itemBuilder: (context, index) => ListTile(
          title: Text('Task title',
              style: TextStyle(decoration: TextDecoration.lineThrough)),
          onTap: () {},
          onLongPress: () {}),
    );
  }
}
