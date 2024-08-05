import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Settingprovider extends ChangeNotifier {
  String selectedlanguage = "en";
  ThemeMode currentmode = ThemeMode.light;
void  changemode(ThemeMode mode){
  if(mode == currentmode)return;
  currentmode = mode;
  notifyListeners();
}
  void changelanguage(String lang) {
    if (lang == selectedlanguage) return;
    selectedlanguage = lang;
    notifyListeners();
  }

  bool isdark() {
    return currentmode == ThemeMode.dark;

  }

  String getbackground() {
    return currentmode == ThemeMode.dark
        ? "assets/images/home_dark_background.png"
        : "assets/images/background.png";
  } String getsplash() {
    return currentmode == ThemeMode.dark
        ? "assets/images/splash_dark.png"
        : "assets/images/splash.png";
  }
}
