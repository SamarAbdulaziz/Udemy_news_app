import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_news_app/layout/cubit/cubit_state.dart';
import 'package:udemy_news_app/modules/business/business_Screen.dart';
import 'package:udemy_news_app/modules/science/science_Screen.dart';
import 'package:udemy_news_app/modules/settings/settings_Screen.dart';
import 'package:udemy_news_app/modules/sports/sports_screen.dart';
class NewsCubit extends Cubit<NewsState>{
  NewsCubit() : super(InitialNewsState());

  static NewsCubit get(context) =>  BlocProvider.of(context);
  int currentIndex=0;
  List<Widget> screens=[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];
  List<BottomNavigationBarItem> BottomItems=[
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];
  void changeBottomNavBar(int index){
    currentIndex=index;
    emit(NewsBottomNavState());
  }
}