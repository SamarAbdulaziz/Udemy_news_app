part of 'Shop_cubit.dart';

@immutable
abstract class ShopStates {}

class ShopInitialStates extends ShopStates {}
class ShopChangeBottomNavState extends ShopStates{}
class ShopLoadingHomeDateState extends ShopStates{}
class ShopSuccessHomeDataState extends ShopStates{}
class ShopErrorHomeDataState extends ShopStates{}
class ShopSuccessCategoriesState extends ShopStates{}
class ShopErrorCategoriesState extends ShopStates{}
