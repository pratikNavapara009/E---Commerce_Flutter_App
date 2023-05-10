import 'package:e_commerce/models/thememodels.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeModel themeModel = ThemeModel(isDark: false);

  void changeTheme() {
    themeModel.isDark = !themeModel.isDark;
    notifyListeners();
  }
}
