import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_news_app/layout/cubit/cubit_cubit.dart';
import 'package:udemy_news_app/layout/cubit/cubit_state.dart';
import 'package:udemy_news_app/network/cache_helper/cache_helper.dart';
import 'package:udemy_news_app/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('news app',
            ),
            actions: [
              IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: (){
                  cubit.changeAppMode();
                },
                icon: Icon(
                  Icons.brightness_4_outlined,
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items:cubit.BottomItems,
            onTap: (index){
             cubit.changeBottomNavBar(index);

            },
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
