import 'package:flutter/material.dart';

class MenuItem {
  final String text;
  final Widget? child;
  MenuItem({this.text = "", this.child});
}

class MenuItems {
  static List<MenuItem> items = [itemLanguage, itemLogOut];

  static MenuItem itemLanguage =
      MenuItem(child: const Icon(Icons.language), text: "Language");

  static MenuItem itemLogOut =
      MenuItem(child: const Icon(Icons.logout), text: "Log out");
}
