import 'package:flutter/material.dart';
import 'home_viewmodel.dart';
import '../view.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            SelectorView<HomeViewmodel, int>(
              selector: (_, vm) {
                if (vm == null) return null;
                if (vm.counter == null) return null;
                return vm.counter.value;
              },
              builder: (_, __, value, ___) {
                print('Build HomeBody Counter Text');

                return Text('${value != null ? value : ""}',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold));
              },
            ),
          ],
        ),
      );
}
