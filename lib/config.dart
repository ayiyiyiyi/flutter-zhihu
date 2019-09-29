import 'package:flutter/material.dart';

const _themes = <MaterialColor>[
    Colors.blue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.red,
  ];
class GlobalConfig {

  static bool dark = true;
  static Color globalColor = Colors.blue;
  static Color fontColor = new Color(int.parse('dc380d',radix:16)|0xFF000000);
  static Color cardBackgroundColor = new Color(0xFF222222);
  static List<MaterialColor> get themes => _themes;
}