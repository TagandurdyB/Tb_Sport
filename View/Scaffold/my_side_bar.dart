import 'package:flutter/material.dart';
import '/View/Scaffold/my_bar.dart';
import '/View/Widgets/my_container.dart';
import '/ViewModel/Providers/provider_theme.dart';

class MySidebar extends StatelessWidget {
  const MySidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      boxShadows: DistributorTheme(context).shadows.myBar,
      color: DistributorTheme(context).colors.canvas,
      width: 250,
      child: MyBar(),
    );
  }
}