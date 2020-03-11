import 'package:flutter/material.dart';
import 'package:portfolio/navigation/root.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Youssef Lasheen's Portfolio",
      theme: ThemeData.dark(),
      home: Root(),
    );
  }
}
