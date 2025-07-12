import 'package:calculator/ui/view/calculator_screen.dart';
import 'package:calculator/viewModel/calculator_view_model.dart';
import 'package:calculator/ui/theme/themes.dart';
import 'package:calculator/viewModel/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => CalculatorViewModel()),
      ],
      child: Builder(
        builder: (context) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            themeMode: themeProvider.themeMode, // Ahora sí puede accederse al provider
            darkTheme: Themes.darkTheme,
            theme: Themes.lightTheme,
            debugShowCheckedModeBanner: false,
            home: CalculatorScreen(),
          );
        },
      ),
    );
  }
}
