import 'package:flutter/material.dart';
class TFilledButtonTheme {
  TFilledButtonTheme(_);
  static final darkTheme = FilledButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(Colors.blueGrey[900]),
    foregroundColor: WidgetStatePropertyAll(Colors.white),
    elevation: WidgetStatePropertyAll(10)
    )
  );
  static final lightTheme = FilledButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(Colors.lightBlue[600]),
    foregroundColor: WidgetStateProperty.all(Colors.black),
    elevation: WidgetStatePropertyAll(10),

    )
  );


  

}



