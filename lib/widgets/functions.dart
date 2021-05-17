import 'package:shop_app/core/cacheHelper/cache_helper.dart';
import 'package:shop_app/core/end_points.dart';
import 'package:shop_app/core/router/router.dart';
import 'package:shop_app/views/login/login_view.dart';

void signOut() {
  CacheHelper.removeData(key: TOKEN).then((value) {
    if (value) {
      MagicRouter.navigateAndPopAll(LoginView());
    }
  });
}
