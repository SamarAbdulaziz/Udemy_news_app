

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_news_app/layout/cubit/cubit_cubit.dart';
import 'package:udemy_news_app/layout/cubit/cubit_state.dart';
import 'package:udemy_news_app/shared/components/components.dart';

class SportsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var list =NewsCubit.get(context).sports;
        return list.length>0?
        ListView.separated(
          physics: BouncingScrollPhysics(),//to make the scrolling color disappear try to remover it if you forgot it.
          itemBuilder: (context, index) => buildArticleItem(list[index],context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: list.length,
        ): Center(child: CircularProgressIndicator());
      },
    );
  }
}
