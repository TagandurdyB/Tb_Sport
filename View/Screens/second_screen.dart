import 'package:flutter/material.dart';
import '/ViewModel/Providers/provider_table.dart';
import '/ViewModel/size_vm.dart';

// ignore: must_be_immutable
class SecondScreen extends StatelessWidget {
   SecondScreen({super.key});

 late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      // color:Colors.red,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildTable(),
          )
        ],
      ),
    );
  }

  Widget buildHeader() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Tablisa:", style: TextStyle(fontSize: MySize.arentir * 0.07)),
          ElevatedButton(
              onPressed: () => ProcessTable(context).tongleEdit,
              child:
                  Text(DistributorTable(context).isEdit ? "Ýatyr" : "Üýtget"))
        ],
      );




  Widget buildTable() => Scrollbar(
    child: DataTable(
      sortColumnIndex: 0,
      sortAscending: true,
          columns: const [
            DataColumn(label: Text("T/b")),
            DataColumn(label: Text("+")),
          ],
          rows: const [
            DataRow(cells: [
              DataCell(Text("1")),
              DataCell(Text("")),
            ]),
            DataRow(cells: [
              DataCell(Text("2")),
              DataCell(Text("")),
            ]),
            DataRow(cells: [
              DataCell(Text("3")),
              DataCell(Text("")),
            ]),
          ],
        ),
  );
}
