import 'package:flutter/material.dart';
import 'package:tb_olimp/View/Scaffold/my_scaffold_all.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldAll(body: 
    Container(
      alignment: Alignment.center,
      child: const Text("salam add Page"))
    );
  }
}