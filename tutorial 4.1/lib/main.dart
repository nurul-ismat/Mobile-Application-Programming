import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Tutorial Stateful Widgets',
      debugShowCheckedModeBanner: false,
      home: Home(),
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  border: Border.all(width: 5.0, color: Colors.blue[900]),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
                child:
                    Icon(Icons.access_alarm, color: Colors.blue, size: 200.0),
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton.extended(
              onPressed: () {},
              icon: Icon(Icons.colorize),
              label: Text('Red'),
              backgroundColor: Colors.red,
            ),
            FloatingActionButton.extended(
              onPressed: () {},
              icon: Icon(Icons.colorize),
              label: Text('Green'),
              backgroundColor: Colors.green,
            ),
            FloatingActionButton.extended(
              onPressed: () {},
              icon: Icon(Icons.colorize),
              label: Text('Blue'),
              backgroundColor: Colors.blue,
            ),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 150,
          child: Column(
            children: <Widget>[
              Text("Size: 200      Roundness: 50"),
              Slider(
                value: 200.0,
                min: 0.0,
                max: 500.0,
                onChanged: (_) {},
              ),
              Slider(
                value: 100.0,
                min: 0.0,
                max: 150.0,
                onChanged: (_) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
