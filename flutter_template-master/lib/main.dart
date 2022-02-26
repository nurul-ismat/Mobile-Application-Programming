import 'package:flutter/material.dart';
import 'package:flutter_template/screens/home/index.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Template',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(),
    ));
