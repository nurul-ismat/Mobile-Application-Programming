import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'MAP',
      home: Home(),
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        drawer: null,
        body: Center(
          child: Text(
            'MAP Tutorial',
            style: TextStyle(fontSize: 50),
          ),
        ),
        floatingActionButton: null,
        bottomNavigationBar: null,
      ),
    );
  }
}
