import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_news_app/layout/cubit/cubit_cubit.dart';
import 'package:udemy_news_app/layout/shop_app/shop_layout.dart';
import 'package:udemy_news_app/modules/shop_app/shopApp_login_screen/ShopAppLoginScreen.dart';
import 'package:udemy_news_app/shared/blocObserver.dart';
import 'package:udemy_news_app/shared/components/constants.dart';
import 'package:udemy_news_app/shared/network/local/cache_helper/cache_helper.dart';
import 'package:udemy_news_app/shared/network/remote/dio_helper.dart';
import 'package:udemy_news_app/shared/styles/themes.dart';

import 'layout/cubit/cubit_state.dart';
import 'layout/shop_app/shop_cubit/Shop_cubit.dart';
import 'modules/shop_app/on_boarding/onboardingScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  if(onBoarding!=null){
    if(token!=null){
      widget=ShopLayout();
  }else
    widget=ShopAppLoginScreen();
  }
  else widget=OnBoardingScreen();
  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget? startWidget;

  MyApp({this.isDark,this.startWidget});//

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) => NewsCubit()..getBusiness()..getSports()..getScience()..changeAppMode(
        fromShared: isDark,
      ),
),
    BlocProvider(
      create: (context) => ShopCubit()..getHomeData()..getCategoriesData(),
    ),
  ],
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
            child:startWidget!,//nullsaftey error !?
        ),
      );
  },
),
);
  }
}

