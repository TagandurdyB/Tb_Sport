import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../names_vm.dart';

class ProviderTable extends ChangeNotifier {
  bool _edit = false;
  bool get edit => _edit;
  void changeEdit(bool b) {
    _edit = b;
    notifyListeners();
  }

  void tongleEdit() {
    _edit = !_edit;
    notifyListeners();
  }

  final myBase = Hive.box(Names.tables);

  void addTable(String table) {
    myBase.add(table);
    notifyListeners();
  }

  List tableValues() {
    final getHive = myBase.values.toList();
    if (getHive.isEmpty) {
      return [];
    }
    return getHive;
  }

  List tableKeys() {
    final getHive = myBase.keys.toList();
    if (getHive.isEmpty) {
      return [];
    }
    return getHive;
  }

  void editTable(int index, String name) {
    myBase.putAt(index, name);
    notifyListeners();
  }

  void deleteTable(int index) {
    myBase.deleteAt(index);
    notifyListeners();
  }

  int _tabedIndex = -1;
  int get tabedIndex => _tabedIndex;
  void changeIndex(int index) {
    _tabedIndex = index;
    notifyListeners();
  }
}

class ProcessTable {
  final BuildContext context;
  ProcessTable(this.context);

  dynamic _changeProvider(BuildContext context) {
    return Provider.of<ProviderTable>(context, listen: false);
  }

  void changeIsEdit(bool b) => _changeProvider(context).changeEdit(b);
  void get tongleEdit => _changeProvider(context).tongleEdit();
  void addTable(String value) => _changeProvider(context).addTable(value);
  void deleteTable(int index) => _changeProvider(context).deleteTable(index);
  void editTable(int index, String name) =>
      _changeProvider(context).editTable(index, name);
  int get length => _changeProvider(context).tableValues().length;

  void changeIndex(int i) => _changeProvider(context).changeIndex(i);
  int get tabIndex => _changeProvider(context).tabedIndex;

  void get deleteIndex => _changeProvider(context).deleteTable(tabIndex);
  void editIndex(String name) =>
      _changeProvider(context).editTable(tabIndex, name);

  String get valueIndex => _changeProvider(context).tableValues()[tabIndex];
  String value(int index) => _changeProvider(context).tableValues()[index];
}

class DistributorTable {
  final BuildContext context;
  DistributorTable(this.context);

  dynamic _getProvider(BuildContext context) {
    return Provider.of<ProviderTable>(context);
  }

  bool get isEdit => _getProvider(context).edit;
  List get values => _getProvider(context).tableValues();
  String value(int index) => _getProvider(context).tableValues()[index];
  List get keys => _getProvider(context).tableKeys();
  int key(int index) => _getProvider(context).tableKeys()[index];
  int get length => _getProvider(context).tableValues().length;
}
