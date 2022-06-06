import 'package:flutter/material.dart';
import 'package:flutter_campo_minado/src/utils/colors.dart';
import 'package:flutter_campo_minado/src/screens/menu/ui/menu_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campo Minado',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          accentColor: AppColors.bar,
          backgroundColor: AppColors.background,
        ),
        dialogBackgroundColor: AppColors.bar,
        backgroundColor: AppColors.background,
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.bar,
          elevation: 0,
        ),
      ),
      home: const MenuScreen(),
    );
  }
}
