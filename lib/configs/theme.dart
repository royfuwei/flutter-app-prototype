import 'package:flutter/material.dart';
import 'package:seeks_flutter/constants.dart';

ThemeData theme() {
  return ThemeData(
    brightness: Brightness.light, //選擇亮度主題，有白色/黑色兩種可選
    scaffoldBackgroundColor: Colors.white,
    // appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    // dev
    primarySwatch: Colors.teal,
    highlightColor: Color.fromRGBO(0, 0, 0, 0),
    splashColor: Color.fromRGBO(0, 0, 0, 0),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 42),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
    headline5: TextStyle(
      color: seeksLoginColor01,
      fontFamily: 'Jaldi',
      fontSize: 24,
      letterSpacing: -0.30000001192092896,
      fontWeight: FontWeight.bold,
      height: 1.5,
    ),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Color(0XFF8B8B8B),
        fontSize: 18,
      ),
    ),
  );
}
