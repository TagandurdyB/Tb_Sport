import 'package:flutter/material.dart';
import '/View/Widgets/ReadyInput/ready_input_base.dart';
import '/View/Widgets/pop_input_w.dart';
import '/ViewModel/Providers/provider_theme.dart';
import '../../ViewModel/Providers/provider_table_detal.dart';
import '../../ViewModel/names_vm.dart';
import '../Scaffold/my_scaffold_all.dart';
import '/ViewModel/size_vm.dart';

// ignore: must_be_immutable
class TablePage extends StatelessWidget {
  TablePage({super.key});
  final ScrollController horizontal = ScrollController(),
      vertical = ScrollController();

  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return ScaffoldAll(
      body: Container(
        // color:Colors.red,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:buildScrolTable()/* Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildScrolTable(),
                  Visibility(
                      visible: DistributorDetal(context).isEdit,
                      child: IconButton(
                          onPressed: _addPop,
                          icon: Icon(Icons.add,
                              color: DistributorTheme(context).colors.text))),
                ],
              )*/,
            )
          ],
        ),
      ),
    );
  }

  void _addPop() {
    PopInput(
      title: "Sütünüň ady",
      inputTag: Tags.nameColumn,
      nameBtn: "TAMAM",
      func: _addColumn,
    ).pop(context);
  }

  void _addColumn() {
    final String name = RIBase.getText(Tags.nameColumn);
    ProcessDetal(context).addColumn(name);
  }

  Widget buildScrolTable() {
    return SizedBox(
     // width: 500,
     // height: MySize.height*0.8,
      child: Scrollbar(
          controller: vertical,
          thumbVisibility: true,
          trackVisibility: true,
          child: Scrollbar(
              controller: horizontal,
              thumbVisibility: true,
              trackVisibility: true,
              notificationPredicate: (notif) => notif.depth == 1,
              child: SingleChildScrollView(
                  controller: vertical,
                  child: SingleChildScrollView(
                      controller: horizontal,
                      scrollDirection: Axis.horizontal,
                      child: buildTable())))),
    );
  }

  Widget buildHeader() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Tablisa: ${DistributorDetal(context).tableName}",
              style: TextStyle(fontSize: MySize.arentir * 0.07)),
          Row(
            children: [
                   Visibility(
                      visible: DistributorDetal(context).isEdit,
                      child: IconButton(
                          onPressed: _addPop,
                          icon: Icon(Icons.add,
                              color: DistributorTheme(context).colors.text))),
              ElevatedButton(
                  onPressed: () => ProcessDetal(context).tongleEdit,
                  child:
                      Text(DistributorDetal(context).isEdit ? "Ýatyr" : "GOŞ")),
            ],
          )
        ],
      );

  Widget buildTable() => DataTable(
        sortColumnIndex: 0,
        sortAscending: true,
        columns: List.generate(
            DistributorDetal(context).length,
            (index) => DataColumn(
                label: Text(DistributorDetal(context).value(index),
                    style: DistributorTheme(context).styles.column))),
        //  const [
        //   DataColumn(label: Text("T/b")),
        //   DataColumn(label: Text("+")),
        // ],
        rows: [
          DataRow(
              cells: List.generate(
                  DistributorDetal(context).length,
                  (index) =>
                      DataCell(Text(DistributorDetal(context).value(index))))),
        ],
      );
}
