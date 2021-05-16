import 'package:flutter/material.dart';
import 'package:shop_app/core/cacheHelper/cache_helper.dart';
import 'package:shop_app/core/end_points.dart';
import 'package:shop_app/core/router/router.dart';
import 'package:shop_app/views/login/login_view.dart';

class ShopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Salla',
              style:
                  Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 32)),
        ),
        body: Center(
          child: TextButton(
            child: Text('SIGN OUT'),
            onPressed: () {
              CacheHelper.removeData(key: TOKEN).then((value) {
                if (value) {
                  MagicRouter.navigateAndPopAll(LoginView());
                }
              });
            },
          ),
        ));
  }
}
