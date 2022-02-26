import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:udemy_news_app/shared/styles/colors.dart';



ThemeData lightTheme=ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
//    backgroundColor: Colors.deepOrange,//it takes the color of the primary swatch
  ),
  appBarTheme: AppBarTheme(
      titleSpacing: 20.0,
      color: Colors.white,
      elevation: 0.0,
      backwardsCompatibility: false, //to control status bar settings.
      systemOverlayStyle: SystemUiOverlayStyle( //status bar settings
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,

      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),

  ),
);


ThemeData darkTheme=ThemeData(

  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Color(0xff333739),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,
  ),
  appBarTheme: AppBarTheme(
      titleSpacing: 20.0,
      color: Color(0xff333739),
      elevation: 0.0,
      backwardsCompatibility: false,
      //to control status bar settings.
      systemOverlayStyle: SystemUiOverlayStyle( //status bar settings
        statusBarColor: Color(0xff333739),
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,

      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xff333739),
    type: BottomNavigationBarType.fixed,
    selectedItemColor:defaultColor,
    unselectedItemColor: Colors.grey,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
);
