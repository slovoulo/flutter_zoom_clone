import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class ThemeProvider extends ChangeNotifier{
//   ThemeMode themeMode= ThemeMode.dark;
//
//   bool get isDarkmode => themeMode ==ThemeMode.dark;
//
//   void toggleTheme(bool isOn){
//     themeMode= isOn?ThemeMode.dark:ThemeMode.light;
//     notifyListeners();
//   }
//
// }
//
// class MyThemes{
//   static final darktheme= ThemeData(scaffoldBackgroundColor: Colors.black38, colorScheme: ColorScheme.dark());
//
//   static final lightheme= ThemeData(scaffoldBackgroundColor: Colors.white70, colorScheme: ColorScheme.light());
// }

class DarkMode with ChangeNotifier {
  bool darkMode = true; ///by default it is true
  ///made a method which will execute while switching
  changemode() {
    darkMode = !darkMode;
    notifyListeners(); ///notify the value or update the widget value
  }
}