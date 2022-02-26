import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_news_app/layout/shop_app/shop_cubit/Shop_cubit.dart';
import 'package:udemy_news_app/modules/shop_app/search/search_screen.dart';
import 'package:udemy_news_app/shared/components/components.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit =ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Salla',
            ),
            actions: [
              IconButton(onPressed: (){
                navigateTo(context, SearchScreen());
              },
                  icon: Icon(Icons.search,
                  ),
              ),
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              cubit.changeBottomNav(index);
            },
            currentIndex: cubit.currentIndex,
              items:[
                BottomNavigationBarItem(
                    icon:Icon(
                        Icons.home
                    ),
                    label: 'Home',
                ),
                BottomNavigationBarItem(
                    icon:Icon(
                        Icons.apps,
                    ),
                    label: 'Categories',
                ),
                BottomNavigationBarItem(
                    icon:Icon(
                        Icons.favorite
                    ),
                    label: 'Favorites',
                ),
                BottomNavigationBarItem(
                    icon:Icon(
                        Icons.settings
                    ),
                    label: 'Settings',
                ),
              ] ,
          ),
        );
      },
    );
  }
}
