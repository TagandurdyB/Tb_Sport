// ignore_for_file: overridden_fields

import '/Model/styles_model.dart';
import 'package:flutter/material.dart';
import '/Model/words_model.dart';

class Texts {
  Text mainTitle = Text("Hasabat Tory", style: ThemeStyle().appBar);
  Text deletePop = Text(Words.deletePop, style: ThemeStyle().appBar,textAlign: TextAlign.center);
  Text editPop = Text(Words.editPop, style: ThemeStyle().appBar,textAlign: TextAlign.center);
}

class TextsDark extends Texts {
  @override
  Text mainTitle = Text("Hasabat Tory", style: ThemeDarkStyle().appBar);
    @override
  Text deletePop = Text(Words.deletePop, style: ThemeDarkStyle().appBar,textAlign: TextAlign.center);
    @override
  Text editPop = Text(Words.editPop, style: ThemeDarkStyle().appBar,textAlign: TextAlign.center);
}
