import 'package:tb_olimp/Model/menu_items_m.dart';
import 'package:tb_olimp/View/Widgets/my_pop.dart';

import '../../ViewModel/size_vm.dart';
import '../Widgets/my_container.dart';
import '/View/Scaffold/provider_app_bar.dart';
import 'package:flutter/material.dart';
import '/ViewModel/Providers/provider_theme.dart';

// ignore: must_be_immutable
class MyAppBar extends StatelessWidget {
  final Function? funcBackBtn;
  MyAppBar({super.key, this.funcBackBtn});

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    final providerTheme = DistributorTheme(context);
    final providerAppbar = DistributorAppBar(context);
    return AppBar(
      leading: providerAppbar.leading,
      centerTitle: MySize.isPortreit,
      title: providerTheme.texts.mainTitle,
      actions: [buildSetting()],
    );
  }

  Widget buildSetting() {
    return PopupMenuButton<MenuItem>(
        onSelected: (item) => _onSelected(item),
        icon: Icon(Icons.settings,
            color: DistributorTheme(context).colors.appBarIcon),
        color: DistributorTheme(context).colors.canvas,
        itemBuilder: (context) => [...MenuItems.items.map(buildItem).toList()]);
  }

  void _onSelected(MenuItem item) {
    if (item == MenuItems.itemLanguage) {
      debugPrint("lang");
      _funcLanguage();
    } else if (item == MenuItems.itemLogOut) {}
  }

  void _funcLanguage() {
    MyPopUpp(
            width: MySize.width * 0.3,
            height: MySize.height * 0.3,
            title: "Selected Language",
            content: buildLangBtns())
        .pop(context);
  }

  Widget buildLangBtns() {
    return Wrap(
      children: [
        buildLangBtn(Icons.flag, "RU"),
        buildLangBtn(Icons.flag, "EN"),
      ],
    );
  }

  Widget buildLangBtn(IconData iconD, String text) {
    return MyContainer(
      borderWidth: 2,
      width: MySize.arentir*0.3,
      height: MySize.arentir*0.2,
      onTap: () => Navigator.pop(context),
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        Icon(iconD),
        Text(text),
      ]),
    );
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) {
    return PopupMenuItem(
      value: item,
      child: Row(
        children: [
          item.child!,
          const SizedBox(width: 10),
          Text(item.text, style: ProcessTheme(context).styles.column)
        ],
      ),
    );
  }
}
