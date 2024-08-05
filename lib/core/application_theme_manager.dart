import 'dart:ui';

import 'package:flutter/material.dart';

class ApplicationThemeManager {
 static const Color primarycolor =  Color(0xFFB7935F);
 static const Color primaryColorDark =  Color(0xFFFACC1D);
 static const Color iconcolor = Color(0xFF242424);
 static const Color icondarkcolor = Color(0xFFFACC1D);
 static const String fontfamily="El Messiri";
  static ThemeData lighttheme = ThemeData(
    primaryColor: primarycolor,
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: primarycolor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor:iconcolor,
      unselectedItemColor: Color(0xFFF8F8F8),
      selectedIconTheme: IconThemeData(
        size: 35,
        color: iconcolor,
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xFFF8F8F8),
        size: 28,
      ),
      showUnselectedLabels: false,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: fontfamily,
        fontSize: 30,
        fontWeight: FontWeight.w700,
        color: iconcolor,
      ),
      bodyLarge: TextStyle(
        fontFamily:fontfamily,
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color:iconcolor,
      ),
      bodyMedium: TextStyle(
        fontFamily:fontfamily,
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color:iconcolor,
      ),
      bodySmall: TextStyle(
        fontFamily: fontfamily,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: iconcolor,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: primarycolor,
    )
  );
  static ThemeData darktheme = ThemeData(
    primaryColor: primaryColorDark,
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF141A2E),
      type: BottomNavigationBarType.fixed,
      selectedItemColor:icondarkcolor,
      unselectedItemColor: Color(0xFFF8F8F8),
      selectedIconTheme: IconThemeData(
        size: 35,
        color: icondarkcolor,
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xFFF8F8F8),
        size: 28,
      ),
      showUnselectedLabels: false,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white
      )
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: fontfamily,
        fontSize: 30,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontFamily:fontfamily,
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color:Colors.white,
      ),
      bodyMedium: TextStyle(
        fontFamily:fontfamily,
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color:Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: fontfamily,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    ),
    dividerTheme: DividerThemeData(
      color:Color(0xFFFACC1D) ,
    )
  );
}
