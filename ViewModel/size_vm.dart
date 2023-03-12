import 'package:flutter/material.dart';

double _screenWidth = 0.0;
double _screenHeight = 0.0;
double _screenContentWidth = 0.0;
double _screenArentir = 0.0;
bool _screenIsPortreit = false;
bool _screenIsWeb = false;

class MySize extends ChangeNotifier {
  static double get arentir => _screenArentir;
  static double get contentWidth => _screenContentWidth;
  static double get width => _screenWidth;
  static double get height => _screenHeight;
  Size get size => Size(_screenWidth, _screenHeight);
  static bool get isPortreit => _screenIsPortreit;
  static bool get isLandscape => !_screenIsPortreit;
  static bool get isWeb => _screenIsWeb;
  void changeWidth(double width) {
    _screenWidth = width;
    notifyListeners();
  }

  void changeHeight(double height) {
    _screenHeight = height;
    notifyListeners();
  }

  void changeSize(double width, double height) {
    if (width > height) {
      _screenIsPortreit = false;
      _screenWidth = width;
      _screenHeight = height;
    } else {
      _screenIsPortreit = true;
      _screenWidth = width;
      _screenHeight = height;
    }

    if (width <= 1000) {
      _screenIsWeb = false;
      _screenContentWidth = width;
    } else {
      _screenIsWeb = true;
      _screenContentWidth = width - 250;
    }

    _screenArentir = 400;
    notifyListeners();
  }
}
