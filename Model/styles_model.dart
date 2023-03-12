// ignore_for_file: overridden_fields

import '/ViewModel/size_vm.dart';
import 'package:flutter/material.dart';

class ThemeStyle {
  TextStyle appBar =
      TextStyle(color: Colors.black, fontSize: MySize.arentir * 0.05);
  TextStyle input =
      TextStyle(color: Colors.black, fontSize: MySize.arentir * 0.035);
  TextStyle popTitle =
      TextStyle(color: Colors.black, fontSize: MySize.arentir * 0.06);
  TextStyle popAction =
      TextStyle(color: Colors.black, fontSize: MySize.arentir * 0.035);
        TextStyle column =
      TextStyle(color: Colors.black, fontSize: MySize.arentir * 0.04);
}

class ThemeDarkStyle extends ThemeStyle {
  @override
  TextStyle appBar =
      TextStyle(color: Colors.white, fontSize: MySize.arentir * 0.05);
   @override
  TextStyle input =
      TextStyle(color: Colors.white, fontSize: MySize.arentir * 0.035);
  @override
  TextStyle popTitle =
      TextStyle(color: Colors.white, fontSize: MySize.arentir * 0.06);
  @override
  TextStyle popAction =
      TextStyle(color: Colors.white, fontSize: MySize.arentir * 0.035);
        @override
  TextStyle column =
      TextStyle(color: Colors.white, fontSize: MySize.arentir * 0.04);
}
