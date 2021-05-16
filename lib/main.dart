import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/end_points.dart';
import 'package:shop_app/core/theme/theme_cubit.dart';
import 'package:shop_app/utilities/bloc_observer.dart';
import 'package:shop_app/views/login/login_view.dart';
import 'package:shop_app/views/on_boarding/on_boarding_view.dart';
import 'package:shop_app/views/shop/shop_view.dart';
import 'core/cacheHelper/cache_helper.dart';
import 'core/dioHelper/dio_helper.dart';
import 'core/router/router.dart';
import 'core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  //===============================================================
  await CacheHelper.init();
  //===============================================================
  Widget widget;
  bool isDark = CacheHelper.get(key: ISDARK);
  bool onBoarding = CacheHelper.get(key: ONBOARDING);
  String token = CacheHelper.get(key: TOKEN);
  if (onBoarding != null) {
    if (token != null)
      widget = ShopView();
    else
      widget = LoginView();
  } else {
    widget = OnBoardingView();
  }
  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;

  const MyApp({
    Key key,
    this.isDark = false,
    this.startWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          var themeCubit = ThemeCubit.get(context).isDark;
          return MaterialApp(
            title: 'Shop App',
            themeMode: themeCubit ? ThemeMode.dark : ThemeMode.light,
            theme: lightTheme,
            darkTheme: darkTheme,
            navigatorKey: navigatorKey,
            onGenerateRoute: onGenerateRoute,
            debugShowCheckedModeBanner: false,
            home: startWidget,
          );
        },
      ),
    );
  }
}
