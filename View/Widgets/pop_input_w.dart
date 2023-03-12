import 'package:flutter/material.dart';

import '../../ViewModel/size_vm.dart';
import 'ReadyInput/ready_input.dart';
import 'my_pop.dart';

class PopInput {
  final String title;
  final String startVal;
  final String inputTag;
  final String nameBtn;
  final Function? func;
  final bool canPop;
  PopInput(
      {this.func,
      this.canPop=true,
      this.title = "Title",
      this.startVal = "",
      required this.inputTag,
      this.nameBtn = "OK"});
  void pop(BuildContext context) {
    MyPopUpp(
        width: MySize.width * 0.3,
        height: MySize.height * 0.3,
        shape: 20,
        title: title,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ReadyInput(
            startVal: startVal,
            autoFocus: true,
            tag: inputTag,
            cursorColor: Colors.amber,
            disableBorderColor: Colors.purple,
            shape: true,
            label: "Adyny giriz",
          ),
        ),
        actions: [
          ActionTeam(text: "ÝATYR"),
          ActionTeam(canPop: canPop, text: nameBtn, func: func)
        ]).pop(context);
  }
}
