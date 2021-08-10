import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'layout/news_app/news_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          backwardsCompatibility: false,
          systemOverlayStyle:SystemUiOverlayStyle(
            statusBarColor: Colors.purple,
           statusBarIconBrightness: Brightness.dark,
          ) ,
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
          selectedItemColor:  Colors.orange,
        )
      ),
      debugShowCheckedModeBanner: false,
      home: NewsLayout(),
       );
  }
}


