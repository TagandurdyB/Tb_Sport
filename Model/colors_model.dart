// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';

class ThemeColor {
  Color appBar = Colors.grey[300]!;
  Color text = Colors.black;
  Color canvas = Colors.white;
  Color drawerIcon = const Color(0xff9245FF);
  Color myBar = Colors.grey[100]!;
  Color appBarIcon = Colors.black;
    Color myPop = Colors.grey[200]!;
}

class ThemeDarkColor extends ThemeColor {
  @override
  Color appBar = const Color.fromARGB(255, 66, 66, 66);
  @override
  Color text = Colors.white;
  @override
  Color canvas = const Color.fromARGB(255, 97, 97, 97);
  @override
  Color drawerIcon = const Color.fromARGB(255, 218, 139, 250);
  @override
  Color myBar = const Color.fromARGB(255, 65, 63, 63);
  @override
  Color appBarIcon = Colors.white;
    @override
  Color myPop = Colors.grey[800]!;
}
