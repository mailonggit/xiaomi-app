import 'package:ecommerce/UI/page/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xiaomi product',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),      
      home: Login(),
    );
  }
}
