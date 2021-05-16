import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/core/cacheHelper/cache_helper.dart';
import 'package:shop_app/core/end_points.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeChangeState());

  static ThemeCubit get(context) => BlocProvider.of(context);

//===============================================================
  bool isDark = false;

  void changeTheme({bool themeModeFromSharedprefs}) {
    if (themeModeFromSharedprefs != null) {
      isDark = themeModeFromSharedprefs;
      emit(ThemeChangeState());
    } else {
      isDark = !isDark;
      CacheHelper.setBoolean(key: ISDARK, value: isDark)
          .then((value) => emit(ThemeChangeState()));
    }
  }
//===============================================================
}
