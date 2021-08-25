import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_news_app/layout/cubit/cubit_cubit.dart';
import 'package:udemy_news_app/network/cache_helper/cache_helper.dart';
import 'package:udemy_news_app/network/remote/dio_helper.dart';
import 'package:udemy_news_app/shared/blocObserver.dart';

import 'layout/cubit/cubit_state.dart';
import 'layout/news_app/news_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness()..getSports()..getScience()..changeAppMode(
        fromShared: isDark,
      ),
      child: BlocConsumer<NewsCubit, NewsState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          scaffoldBackgroundColor: Colors.white,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepOrange,
          ),
          appBarTheme: AppBarTheme(
              titleSpacing: 20.0,
              color: Colors.white,
              elevation: 0.0,
              backwardsCompatibility: false,
              //to control status bar settings.
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
            selectedItemColor: Colors.orange,
            backgroundColor: Colors.white,
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),

          ),
        ),

        darkTheme: ThemeData(

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
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.grey,
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),

        themeMode: NewsCubit.get(context).isDark? ThemeMode.dark:ThemeMode.light,

        debugShowCheckedModeBanner: false,
        home: Directionality(
            textDirection: TextDirection.ltr,
            child: NewsLayout()),
      );
  },
),
    );
  }
}

