import 'package:calculator/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      title: 'Scientific Calculator',
      theme: ThemeData(primarySwatch: Colors.orange),
    );
  }
}