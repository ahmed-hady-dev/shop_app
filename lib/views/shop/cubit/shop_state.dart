part of 'shop_cubit.dart';

@immutable
abstract class ShopState {}

class ShopInitial extends ShopState {}

//===============================================================
class ShopChangeBottomNavState extends ShopState {}

//===============================================================
class ShopLoadingHomeDataState extends ShopState {}

class ShopSuccessHomeDataState extends ShopState {}

class ShopErrorHomeDataState extends ShopState {}

//===============================================================
class ShopSuccessCategoriesState extends ShopState {}

class ShopErrorCategoriesState extends ShopState {}

//===============================================================
class ShopSuccessChangeFavoritesState extends ShopState {}

class ShopErrorChangeFavoritesState extends ShopState {}

//===============================================================
class ShopLoadingGetFavoritesState extends ShopState {}

class ShopSuccessGetFavoritesState extends ShopState {}

class ShopErrorGetFavoritesState extends ShopState {}

//===============================================================
class ShopLoadingGetUserDataState extends ShopState {}

class ShopSuccessGetUserDataState extends ShopState {
  final LoginModel loginModel;

  ShopSuccessGetUserDataState(this.loginModel);
}

class ShopErrorGetUserDataState extends ShopState {}

//===============================================================
class ShopLoadingUpdateUserDataState extends ShopState {}

class ShopSuccessUpdateUserDataState extends ShopState {
  final LoginModel loginModel;

  ShopSuccessUpdateUserDataState(this.loginModel);
}

class ShopErrorUpdateUserDataState extends ShopState {}
//===============================================================
