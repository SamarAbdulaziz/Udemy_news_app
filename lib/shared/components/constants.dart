
// POST
// UPDATE
// DELETE

// GET

// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
import 'package:udemy_news_app/modules/shop_app/shopApp_login_screen/ShopAppLoginScreen.dart';
import 'package:udemy_news_app/shared/network/local/cache_helper/cache_helper.dart';

import 'components.dart';

void singOut(context){
  CacheHelper.removeData(key: 'token').then(
          (value) {
        if (value)
          navigateAndFinish(context, ShopAppLoginScreen());
      });
}
String ? token;
