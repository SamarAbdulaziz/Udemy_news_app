import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_news_app/layout/cubit/cubit_state.dart';
import 'package:udemy_news_app/modules/news_app/business/business_Screen.dart';
import 'package:udemy_news_app/modules/news_app/science/science_Screen.dart';
import 'package:udemy_news_app/modules/news_app/sports/sports_screen.dart';
import 'package:udemy_news_app/modules/settings/settings_Screen.dart';
import 'package:udemy_news_app/shared/network/local/cache_helper/cache_helper.dart';
import 'package:udemy_news_app/shared/network/remote/dio_helper.dart';
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

  List <dynamic> business=[];


  void getBusiness(){
    if (business.length==0){
      emit(NewGetBusinessLoadingState());

      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'business',
            'apiKey':'c4d1a19beb064845942332421ccd3ae2',
          }
      ).then((value) {
       // print(value.data['articles'][0]['title']);
        business=value.data['articles'];
        emit(NewGetBusinessSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewGetBusinessErrorState(error.toString()));
      });
    }else
      emit(NewGetBusinessSuccessState());


  }

  List <dynamic> sports=[];

  void getSports(){
    if(sports.length==0){
      emit(NewGetSportsLoadingState());

      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'Sports',
            'apiKey':'c4d1a19beb064845942332421ccd3ae2',
          }
      ).then((value) {
       // print(value.data['articles'][0]['title']);
        sports=value.data['articles'];
        emit(NewGetSportsSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewGetSportsErrorState(error.toString()));
      });
    }else
      emit(NewGetSportsSuccessState());


  }

  List <dynamic> science=[];

  void getScience(){
    if(science.length==0){
      emit(NewGetScienceLoadingState());

      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'science',
            'apiKey':'c4d1a19beb064845942332421ccd3ae2',
          }
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        science=value.data['articles'];
        emit(NewGetScienceSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewGetScienceErrorState(error.toString()));
      });
    }else
      emit(NewGetScienceSuccessState());


  }

  List <dynamic> search=[];

  void getSearch(String value){
    emit(NewGetSearchLoadingState());

    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q':'$value',
          'apiKey':'c4d1a19beb064845942332421ccd3ae2',
        }
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      search=value.data['articles'];
      emit(NewGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewGetSearchErrorState(error.toString()));
    });


  }


bool isDark=true;//he made it false
  void changeAppMode({
  bool? fromShared,
}){
   if(fromShared!=null) {
     isDark=fromShared;
     emit(AppChangeModeState());
   }
   else{
     isDark=!isDark;
     CacheHelper.setBoolean(key: 'isDark', value: isDark);
     emit(AppChangeModeState());
   }

  }//it must be in AppCubit like he did in the video but i still don't understand


}