import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/views/categories/categories_view.dart';
import 'package:shop_app/views/favoreties/favoreties_view.dart';
import 'package:shop_app/views/products/prouducts_view.dart';
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
}
