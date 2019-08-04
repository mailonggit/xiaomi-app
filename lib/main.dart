import 'package:flutter/material.dart';

import 'UI/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xiaomi product',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),      
      home: HomePage(),
    );
  }
}
