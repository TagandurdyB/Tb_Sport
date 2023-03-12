import '/ViewModel/Providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'ViewModel/routes_vm.dart';
import 'ViewModel/theme_vm.dart';
import 'ViewModel/names_vm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.openBox(Names.tables);
  Hive.openBox(Names.column);
  Hive.openBox(Names.row);
  runApp(MultiProvider(
    providers: MyProvoders.list,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hasabat Tory',
      theme: MyTheme.theme(context),
      initialRoute: Rout.logo,
      routes: Rout.pages,
    );
  }
}
