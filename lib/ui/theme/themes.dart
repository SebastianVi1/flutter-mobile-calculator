import 'package:calculator/ui/theme/filled_button_theme.dart';
import 'package:flutter/material.dart';
class Themes {

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    filledButtonTheme: TFilledButtonTheme.darkTheme,
    
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    filledButtonTheme: TFilledButtonTheme.lightTheme,
    

  );


}
