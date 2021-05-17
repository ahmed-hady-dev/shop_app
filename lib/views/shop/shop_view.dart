import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/cacheHelper/cache_helper.dart';
import 'package:shop_app/core/end_points.dart';
import 'package:shop_app/core/router/router.dart';
import 'package:shop_app/views/login/login_view.dart';
import 'package:shop_app/views/search/search_view.dart';
import 'package:shop_app/views/shop/cubit/shop_cubit.dart';

class ShopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var shopCubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Salla',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 32)),
            actions: [
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    MagicRouter.navigateTo(SearchView());
                  }),
            ],
          ),
          body: shopCubit.bottomViews[shopCubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: shopCubit.currentIndex,
            onTap: (index) => shopCubit.changeBottomViews(index),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.apps), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorites'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
        );
      },
    );
  }
}
