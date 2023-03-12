import 'package:flutter/material.dart';
import '/View/Scaffold/my_bar.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MyBar(),
    );
  }
}