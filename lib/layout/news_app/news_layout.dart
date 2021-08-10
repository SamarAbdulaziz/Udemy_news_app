import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_news_app/layout/cubit/cubit_cubit.dart';
import 'package:udemy_news_app/layout/cubit/cubit_state.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsState>(
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
                  icon: Icon(Icons.search,
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
      ),
    );
  }
}
