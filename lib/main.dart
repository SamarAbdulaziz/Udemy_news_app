import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_news_app/layout/cubit/cubit_cubit.dart';
import 'package:udemy_news_app/network/cache_helper/cache_helper.dart';
import 'package:udemy_news_app/network/remote/dio_helper.dart';
import 'package:udemy_news_app/shared/blocObserver.dart';
import 'package:udemy_news_app/shared/styles/themes.dart';

import 'layout/cubit/cubit_state.dart';
import 'layout/news_app/news_layout.dart';
import 'modules/shop_app/on_boarding/onboardingScreen.dart';

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
        theme: lightTheme,

        darkTheme: darkTheme,

        themeMode: NewsCubit.get(context).isDark? ThemeMode.dark:ThemeMode.light,

        debugShowCheckedModeBanner: false,
        home: Directionality(
            textDirection: TextDirection.ltr,
            child: OnBoardingScreen()),
      );
  },
),
    );
  }
}

