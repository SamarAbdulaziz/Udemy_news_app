import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_news_app/layout/shop_app/shop_cubit/Shop_cubit.dart';
import 'package:udemy_news_app/models/shopApp/HomeModel.dart';
import 'package:udemy_news_app/models/shopApp/categories_model.dart';
import 'package:udemy_news_app/shared/styles/colors.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ShopCubit.get(context).homeModel == null &&
                ShopCubit.get(context).categoriesModel == null
            ? Center(child: CircularProgressIndicator())
            : productsBuilder(ShopCubit.get(context).homeModel,
                ShopCubit.get(context).categoriesModel);
      },
    );
  }

  Widget productsBuilder(HomeModel? model, CategoriesModel? categoriesModel) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: model!.data!.banners
                .map((e) => Image(
                      image: NetworkImage('${e.image}'),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ))
                .toList(),
            options: CarouselOptions(
                height: 250,
                initialPage: 0,
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(
                  seconds: 1,
                ),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 100.0,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          buildCategoryItem(categoriesModel!.data!.data[index]),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10.0,
                          ),
                      itemCount: categoriesModel!.data!.data.length),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'New Products',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            color: Colors.grey[300],
            child: GridView.count(
              shrinkWrap: true, // to build the list all in once
              physics:
                  NeverScrollableScrollPhysics(), //to stop its scrolling because of the scroll of the main screen
              crossAxisCount: 2,
              children: List.generate(
                model.data!.products.length,
                (index) => buildGridProduct(model.data!.products[index]),
              ),
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 1.0,
              childAspectRatio: 1 / 1.72, //1.4 is good for me but just like him //for my phone it must be 1.72
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryItem(DataModel model) => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image(
            image: NetworkImage(
              model.image.toString(),//it was so big problem
            ),
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.8),
            width: 100,
            child: Text(
              model.name.toString(),//it was so big problem
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
  Widget buildGridProduct(ProductModel model) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.end,//i did it
        children: [
          Stack(
            alignment: AlignmentDirectional
                .bottomStart, // Alignment.bottomLeft ....the same
            children: [
              Image(
                image: NetworkImage(
                  model.image
                      .toString(), //i added .toString to remove the error
                ),
                width: double.infinity,
                height: 200,
              ),
              if (model.discount != 0)
                Container(
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    'Discount',
                    style: TextStyle(fontSize: 10.0, color: Colors.white),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(height: 1.3),
                ),
                Row(
                  children: [
                    Text(
                      '${model.price.round()}',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: defaultColor,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    if (model.discount != 0)
                      Text(
                        '${model.oldPrice.round()}',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Spacer(),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        ///todo
                        print(model.id);
                      },
                      icon: Icon(
                        Icons.favorite_border,
                        size: 14,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
