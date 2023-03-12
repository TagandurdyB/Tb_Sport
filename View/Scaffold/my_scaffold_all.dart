import '/View/Scaffold/my_drawer.dart';
import '/ViewModel/size_vm.dart';

import '/View/Scaffold/provider_app_bar.dart';
import '/ViewModel/Providers/provider_theme.dart';
import 'package:flutter/material.dart';
import 'my_app_bar.dart';
import 'my_side_bar.dart';

class ScaffoldAll extends StatelessWidget {
  final Widget body;
  final Function? funcBackBtn;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  const ScaffoldAll(
      {required this.body, super.key, this.funcBackBtn, this.scaffoldKey});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    MySize().changeSize(size.width, size.height);
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        key: key,
        preferredSize: Size.fromHeight(DistributorAppBar(context).drawerHeight),
        child: Container(
          decoration: BoxDecoration(
            color: ProviderTheme().colors.appBar,
            boxShadow: ProviderTheme().shadows.appBar,
          ),
          child: Column(
            children: [
              MyAppBar(funcBackBtn: funcBackBtn),
              Visibility(
                visible: DistributorAppBar(context).bottomDrawer,
                child: Expanded(
                    child: Container(
                  color: ProviderTheme().colors.appBar,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: buildBottom(),
                )),
              )
            ],
          ),
        ),
      ),
      drawer: !MySize.isWeb ? const MyDrawer() : null,
      body: Stack(
        alignment: Alignment.centerLeft,
        children: [
          buildContent(),
          Visibility(visible: MySize.isWeb, child: const MySidebar()),
        ],
      ),
      // bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }

  Widget buildContent() {
    return Row(
      children: [
        Visibility(visible: MySize.isWeb, child: const SizedBox(width: 250)),
        SizedBox(
            width: MySize.contentWidth, height: MySize.height, child: body),
      ],
    );
  }

  Widget buildBottom() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [buildMenueBtn()],
      );

  Widget buildMenueBtn() => Builder(
        builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Icon(Icons.menu)),
      );
}
