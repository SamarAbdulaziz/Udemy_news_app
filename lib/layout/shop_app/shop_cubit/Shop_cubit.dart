import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:udemy_news_app/modules/shop_app/categories/categories_screen.dart';
import 'package:udemy_news_app/modules/shop_app/favorite/favorite_screen.dart';
import 'package:udemy_news_app/modules/shop_app/products/products_screen.dart';
import 'package:udemy_news_app/modules/shop_app/settings/settings_screen.dart';

part '_state.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit():super(ShopInitialStates());
  static ShopCubit get (context)=>BlocProvider.of(context);
  int currentIndex=0;
  List<Widget> bottomScreens=[
    ProductsScreen(),
    CategoriesScreen(),
    FavoriteScreen(),
    SettingsScreen(),
  ];
  void changeBottomNav(int index){
    currentIndex=index;
    emit(ShopChangeBottomNavState());
  }
}
