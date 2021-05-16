import 'package:flutter/material.dart';

MaterialColor swatchify(MaterialColor color, int value) {
  return MaterialColor(color[value].hashCode, <int, Color>{
    50: color[value],
    100: color[value],
    200: color[value],
    300: color[value],
    400: color[value],
    500: color[value],
    600: color[value],
    700: color[value],
    800: color[value],
    900: color[value],
  });
}

//===============================================================
ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: swatchify(Colors.indigo, 800),
  dividerTheme: DividerThemeData(color: Colors.grey),
  fontFamily: 'Jannah',
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    button: TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    titleSpacing: 20.0,
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 20.0,
    backgroundColor: Colors.white,
    selectedItemColor: Colors.red.shade800,
    unselectedItemColor: Colors.grey,
  ),
);
//====================================================
ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Color(0xff333739),
  primarySwatch: swatchify(Colors.red, 800),
  dividerTheme: DividerThemeData(color: Colors.white54),
  fontFamily: 'Jannah',
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 36,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    bodyText2: TextStyle(
      // fontFamily: 'Jannah',
      fontSize: 20,
      color: Colors.white,
    ),
    button: TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    titleSpacing: 20.0,
    backgroundColor: Color(0xff333739),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 20.0,
    backgroundColor: Color(0xff333739),
    selectedItemColor: Colors.red.shade800,
    unselectedItemColor: Colors.white,
  ),
);
