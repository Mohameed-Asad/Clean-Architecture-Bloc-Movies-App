import 'package:flutter/material.dart';

class AppThemeManager {
  static const Color primaryColor = Color(0xfffcb93a);
  static const Color secondaryColor = Color(0xff1D1E1D);
  static ThemeData applicationThemeData = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: const Color(0xff121312),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w200,
        fontSize: 18,
        color: Colors.white,
      ),
      backgroundColor: Color(0xff1D1E1D),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 25,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff1A1A1A),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xffFFB224),
      unselectedItemColor: Color(0xffC6C6C6),
      unselectedIconTheme: IconThemeData(
        color: Color(0xffC6C6C6),
        size: 25,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: "Inter",
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Color(0xffC6C6C6),
      ),
      selectedIconTheme: IconThemeData(
        color: Color(0xffFFB224),
        size: 27,
      ),
      selectedLabelStyle: TextStyle(
        fontFamily: "Inter",
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Color(0xffFFB224),
      ),
    ),
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontFamily: "Inter",
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontFamily: "Inter",
          fontWeight: FontWeight.normal,
          fontSize: 20,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: Colors.white,
        ),
        bodySmall: TextStyle(
          fontFamily: "Inter",
          fontWeight: FontWeight.w200,
          fontSize: 13,
          color: Colors.white,
        ),
      displaySmall: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w100,
        fontSize: 8,
        color: Colors.white,
      ),
    ),
  );
}
