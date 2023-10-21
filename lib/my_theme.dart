import 'package:flutter/material.dart';

class MyTheme{
  static Color greenColor=Color(0xff39A552);
  static Color blackColor = Color(0x6f000000);
  static Color witheColor=Color(0xffffffff);
  static ThemeData lightTheme = ThemeData(
    primaryColor: greenColor,
appBarTheme: AppBarTheme(
  color: greenColor,
  centerTitle: true,
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30)

      )
  ),
),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: witheColor,
      )
    )
  );
}