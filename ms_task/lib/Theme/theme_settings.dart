import 'package:flutter/material.dart';

ThemeData customTheme() {
  return ThemeData(

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color(0xffAF0917)
    ),
    appBarTheme: const AppBarTheme(
      color: Color(0xffE43228)
    ),
    primaryColor: const Color(0xffE43228),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.white,
      indicator: UnderlineTabIndicator()
      
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xffAF0917)
    ),
    
    
  );
}
