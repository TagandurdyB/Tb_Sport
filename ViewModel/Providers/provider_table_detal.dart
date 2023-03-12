import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../names_vm.dart';

class ProviderDetal extends ChangeNotifier {
  bool _edit = false;
  bool get edit => _edit;
  void changeEdit(bool b) {
    _edit = b;
    notifyListeners();
  }

  String _tableName = "";
  String get tableName => _tableName;
  void changeTableName(String name) {
    _tableName = name;
    notifyListeners();
  }

  void tongleEdit() {
    _edit = !_edit;
    /*if (_edit) {
      addColumn("+");
    } else {
      List getHive = _getValue;
      getHive.removeLast();
      myColumn.put(_tableName, getHive);
    }*/
    notifyListeners();
  }

  final myColumn = Hive.box(Names.column);
  final myRow = Hive.box(Names.row);

  void addColumn(String column) {
    List getHive = _getValue;
    getHive.add(column);
    debugPrint("sjdahsd sa $getHive  $_tableName");
    myColumn.put(_tableName, getHive);
    notifyListeners();
  }

  void deleteColumn(int index) {
    List getHive = _getValue;
    getHive.removeLast();
    myColumn.deleteAt(index);
    notifyListeners();
  }

  List get _getValue {
    final value = myColumn.get(_tableName);
    return value ?? [];
  }

  List columnValues() {
    final getHive = myColumn.values.toList();
    if (getHive.isEmpty) {
      return ["T/b"];
    }
    return getHive;
  }

  List tableColumn() {
    final getHive = myColumn.get(_tableName);
    if (getHive == null) {
      addColumn("T/b");
      return ["T/b"];
    } else if (getHive.isEmpty) {
      return ["T/b"];
    }
    return getHive;
  }

  List columnKeys() {
    final getHive = myColumn.keys.toList();
    if (getHive.isEmpty) {
      return [];
    }
    return getHive;
  }

  void editColumn(int index, String name) {
    myColumn.putAt(index, name);
    notifyListeners();
  }

  int _tabedIndex = -1;
  int get tabedIndex => _tabedIndex;
  void changeIndex(int index) {
    _tabedIndex = index;
    notifyListeners();
  }
}

class ProcessDetal {
  final BuildContext context;
  ProcessDetal(this.context);

  dynamic _changeProvider(BuildContext context) {
    return Provider.of<ProviderDetal>(context, listen: false);
  }

  void changeIsEdit(bool b) => _changeProvider(context).changeEdit(b);
  void get tongleEdit => _changeProvider(context).tongleEdit();
  void addColumn(String value) => _changeProvider(context).addColumn(value);
  void deleteTable(int index) => _changeProvider(context).deleteTable(index);
  void editTable(int index, String name) =>
      _changeProvider(context).editTable(index, name);
  int get length => _changeProvider(context).columnValues().length;

  void changeIndex(int i) => _changeProvider(context).changeIndex(i);
  int get tabIndex => _changeProvider(context).tabedIndex;

  void get deleteIndex => _changeProvider(context).deleteTable(tabIndex);
  void editIndex(String name) =>
      _changeProvider(context).editTable(tabIndex, name);

  String get valueIndex => _changeProvider(context).columnValues()[tabIndex];

  void changeTable(String name) =>
      _changeProvider(context).changeTableName(name);
}

class DistributorDetal {
  final BuildContext context;
  DistributorDetal(this.context);

  dynamic _getProvider(BuildContext context) {
    return Provider.of<ProviderDetal>(context);
  }

  bool get isEdit => _getProvider(context).edit;
  List get values => _getProvider(context).columnValues();

  List get keys => _getProvider(context).tableKeys();
  int key(int index) => _getProvider(context).tableKeys()[index];
  int get length => _getProvider(context).tableColumn().length;

  List get tableColumn => _getProvider(context).tableColumn();
  String value(int index) => _getProvider(context).tableColumn()[index];

 String get tableName => _getProvider(context).tableName;

  
}
