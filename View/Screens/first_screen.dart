import 'package:flutter/material.dart';
import '/View/Widgets/ReadyInput/ready_input_base.dart';
import '/View/Widgets/my_container.dart';
import '/View/Widgets/pop_input_w.dart';
import '/ViewModel/Providers/provider_table.dart';
import '/ViewModel/Providers/provider_table_detal.dart';
import '/ViewModel/Providers/provider_theme.dart';

import '../../ViewModel/names_vm.dart';
import '../../ViewModel/routes_vm.dart';
import '../../ViewModel/size_vm.dart';
import '../Widgets/my_pop.dart';

// ignore: must_be_immutable
class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(),
          buildTable(),
        ],
      ),
    );
  }

  Widget buildHeader() => Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tablisalar:",
                style: TextStyle(fontSize: MySize.arentir * 0.07)),
          ],
        ),
      );

  Widget buildTable() => Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Wrap(
              children: List.generate(DistributorTable(context).length + 1,
                  (index) => buildCard(index))),
        ),
      );

  Widget buildCard(int index) {
    final bool isNotAdd = index < DistributorTable(context).length;
    return MyContainer(
      borderColor: DistributorTheme(context).colors.drawerIcon,
      onTap: () => isNotAdd ? _tablePage(index) : _addPop(),
      margin: const EdgeInsets.all(8),
      shape: MySize.arentir * 0.05,
      width: MySize.arentir * 0.5,
      height: MySize.arentir * 0.5,
      alignment: Alignment.center,
      boxShadows: DistributorTheme(context).shadows.all,
      color: DistributorTheme(context).colors.canvas,
      colors: isNotAdd ? const [Colors.red, Colors.blue] : null,
      child: isNotAdd ? buildChild(index) : buildAddChild(),
    );
  }

  void _tablePage(int index) {
    ProcessDetal(context).changeTable(ProcessTable(context).value(index));
    Navigator.pushNamed(context, Rout.table);
  }

  void _addPop() => PopInput(
      title: "Tablissa Ad ber",
      inputTag: Tags.nameTable,
      nameBtn: "GOŞ",
      canPop: false,
      func: () {
        final String value = RIBase.getText(Tags.nameTable);
        ProcessTable(context).addTable(value);
        Navigator.pop(context);
      }).pop(context);

  Widget buildChild(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
              onPressed: () => adjuster(false, index),
              icon: const Icon(Icons.delete, color: Colors.white)),
        ),
        Text(
          DistributorTable(context).value(index),
          style: DistributorTheme(context).styles.appBar,
          textAlign: TextAlign.center,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
              onPressed: () => adjuster(true, index),
              icon: const Icon(Icons.edit, color: Colors.white)),
        ),
      ],
    );
  }

  void adjuster(bool isEdit, int index) {
    ProcessTable(context).changeIndex(index);
    if (isEdit) {
      editPop();
    } else {
      deleteWarning();
    }
  }

  void deleteWarning() =>
      popFunc("Üns beriň!!!", ProcessTheme(context).texts.deletePop, "POZ", () {
        ProcessTable(context).deleteIndex;
      });

  void editPop() => PopInput(
          canPop: false,
          title: "Täzeden at ber",
          inputTag: Tags.newTable,
          nameBtn: "ÜÝTGET",
          func: editWarning,
          startVal: ProcessTable(context).valueIndex)
      .pop(context);

  void editWarning() =>
      popFunc("Üns beriň!!!", ProcessTheme(context).texts.editPop, "ÜÝTGET",
          () {
        final String value = RIBase.getText(Tags.newTable);
        ProcessTable(context).editIndex(value);
        Navigator.pop(context);
      });

  void popFunc(
    String title,
    Widget content,
    String nameBtn,
    Function func,
  ) {
    MyPopUpp(
        width: MySize.width * 0.3,
        height: MySize.height * 0.3,
        shape: 20,
        title: title,
        content: content,
        actions: [
          ActionTeam(text: "ÝATYR"),
          ActionTeam(text: nameBtn, func: func)
        ]).pop(context);
  }

  Widget buildAddChild() => Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(
          Icons.add,
          color: Colors.amber[700],
          size: MySize.arentir * 0.15,
        ),
        const Text("DÖRET")
      ]);
}
