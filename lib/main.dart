import 'package:flutter/material.dart';
import './index/index.dart';
import 'config.dart';
void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '逼乎',
      home: new Index()
    );
  }
}
