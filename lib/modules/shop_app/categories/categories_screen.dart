import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_news_app/layout/shop_app/shop_cubit/Shop_cubit.dart';
import 'package:udemy_news_app/models/shopApp/categories_model.dart';
import 'package:udemy_news_app/shared/components/components.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListView.separated(
            itemBuilder: (context, index) => BuildCatItem(ShopCubit.get(context).categoriesModel!.data!.data[index]),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: ShopCubit.get(context).categoriesModel!.data!.data.length
        );
      },
    );
  }

  Widget BuildCatItem(DataModel model) =>
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Image(
              height: 80.0,
              width: 80.0,
              image: NetworkImage(
                model.image.toString(),
              ),
            ),
            SizedBox(
              width: 40.0,
            ),
            Text(
              '${model.name}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios_outlined),
              onPressed: () {},
            )
          ],
        ),
      );
}
