import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/core/dioHelper/dio_helper.dart';
import 'package:shop_app/core/constants.dart';
import 'package:shop_app/core/router/router.dart';
import 'package:shop_app/functions/print_full_text.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/models/change_favorites_model.dart';
import 'package:shop_app/models/favorites_model.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/views/categories/categories_view.dart';
import 'package:shop_app/views/favorites/favorites_view.dart';
import 'package:shop_app/views/products/products_view.dart';
import 'package:shop_app/views/settings/settings_view.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());

  static ShopCubit get(context) => BlocProvider.of(context);

//===============================================================
  int currentIndex = 0;
  List<Widget> bottomViews = [
    ProductsView(),
    CategoriesView(),
    FavoritesView(),
    SettingsView(),
  ];

  void changeBottomViews(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

//===============================================================
  HomeModel homeModel;
  Map<int, bool> favorites = {};

  void getHomeData() async {
    emit(ShopLoadingHomeDataState());

    Response response = await DioHelper.getData(url: HOME, token: token);
    try {
      emit(ShopSuccessHomeDataState());

      homeModel = HomeModel.fromJson(response.data);
      homeModel.data.products.forEach((element) {
        favorites.addAll({element.id: element.inFavorites});
      });
      print(favorites.toString());

      printFullText(homeModel.status.toString());
    } catch (e) {
      emit(ShopErrorHomeDataState());
      print(e.toString());
    }
  }

//===============================================================
  CategoriesModel categoriesModel;

  void getCategoriesData() async {
    Response response = await DioHelper.getData(url: GET_CATEGORIES);
    try {
      emit(ShopSuccessCategoriesState());
      categoriesModel = CategoriesModel.fromJson(response.data);
      printFullText(categoriesModel.status.toString());
    } catch (e) {
      emit(ShopErrorCategoriesState());
      print(e.toString());
    }
  }

//===============================================================
  ChangeFavoritesModel changeFavoritesModel;

  void changeFavorites(int productId) async {
    favorites[productId] = !favorites[productId];
    emit(ShopSuccessChangeFavoritesState());

    Response response = await DioHelper.postData(
      url: FAVORITES,
      data: {'product_id': productId},
      token: token,
    );
    try {
      emit(ShopSuccessChangeFavoritesState());
      changeFavoritesModel = ChangeFavoritesModel.fromJson(response.data);
      if (!categoriesModel.status) {
        favorites[productId] = !favorites[productId];
      } else {
        getFavorites();
      }
    } catch (error) {
      emit(ShopErrorChangeFavoritesState());
      favorites[productId] = !favorites[productId];
      ScaffoldMessenger.of(MagicRouter.currentContext).showSnackBar(
          SnackBar(content: Text(changeFavoritesModel.message.toString())));

      print(error.toString());
    }
  }

//===============================================================
  FavoritesModel favoritesModel;

  void getFavorites() async {
    emit(ShopLoadingGetFavoritesState());

    Response response = await DioHelper.getData(url: FAVORITES, token: token);
    try {
      emit(ShopSuccessGetFavoritesState());
      favoritesModel = FavoritesModel.fromJson(response.data);
      printFullText(categoriesModel.status.toString());
    } catch (e) {
      emit(ShopErrorGetFavoritesState());
      print(e.toString());
    }
  }

  //===============================================================
  LoginModel userModel;

  void getUserData() async {
    emit(ShopLoadingGetUserDataState());

    Response response = await DioHelper.getData(url: PROFILE, token: token);
    try {
      emit(ShopSuccessGetUserDataState(userModel));
      userModel = LoginModel.fromJson(response.data);
    } catch (e) {
      emit(ShopErrorGetUserDataState());
      print(e.toString());
    }
  }

  //===============================================================
  void updateUserData({
    @required String name,
    @required String email,
    @required String phone,
  }) async {
    emit(ShopLoadingUpdateUserDataState());

    Response response =
        await DioHelper.putData(url: UPDATE_PROFILE, token: token, data: {
      'name': name,
      'phone': phone,
      'email': email,
    });
    try {
      emit(ShopSuccessUpdateUserDataState(userModel));
      userModel = LoginModel.fromJson(response.data);
    } catch (e) {
      emit(ShopErrorUpdateUserDataState());
      print(e.toString());
    }
  }
}
