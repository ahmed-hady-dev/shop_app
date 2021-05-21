import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/core/dioHelper/dio_helper.dart';
import 'package:shop_app/core/constants.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/views/categories/categories_view.dart';
import 'package:shop_app/views/favorites/favorites_view.dart';
import 'package:shop_app/views/products/products_view.dart';
import 'package:shop_app/views/settings/settings_view.dart';
import 'package:shop_app/widgets/functions.dart';

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

  void getHomeData() async {
    emit(ShopLoadingHomeDataState());

    Response response = await DioHelper.getData(url: HOME, token: token);
    try {
      emit(ShopSuccessHomeDataState());
      homeModel = HomeModel.fromJson(response.data);
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

}
