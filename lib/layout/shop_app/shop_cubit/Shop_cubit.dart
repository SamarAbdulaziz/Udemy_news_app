import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:udemy_news_app/models/shopApp/HomeModel.dart';
import 'package:udemy_news_app/models/shopApp/categories_model.dart';
import 'package:udemy_news_app/modules/shop_app/categories/categories_screen.dart';
import 'package:udemy_news_app/modules/shop_app/favorite/favorite_screen.dart';
import 'package:udemy_news_app/modules/shop_app/products/products_screen.dart';
import 'package:udemy_news_app/modules/shop_app/settings/settings_screen.dart';
import 'package:udemy_news_app/shared/components/constants.dart';
import 'package:udemy_news_app/shared/network/end_points.dart';
import 'package:udemy_news_app/shared/network/remote/dio_helper.dart';

part '_state.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialStates());
  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoriteScreen(),
    SettingsScreen(),
  ];
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel? homeModel;
Map<int?,bool?> favorites={};
  void getHomeData() {
    emit(ShopLoadingHomeDateState());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      // print(homeModel!.status);
      // print ('************************************************************');
      // print(homeModel!.data!.banners[0].image.toString());
      homeModel!.data!.products.forEach((element) {
        favorites.addAll({
          element.id:element.inFavorite,
        });
        print(favorites.toString());
      });
      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }
  CategoriesModel? categoriesModel;
  void getCategoriesData() {
    DioHelper.getData(
      url: GET_CATEGORIES,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);

      emit(ShopSuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoriesState());
    });
  }
}
