import 'package:shop_app/core/cacheHelper/cache_helper.dart';
import 'package:shop_app/core/constants.dart';
import 'package:shop_app/core/router/router.dart';
import 'package:shop_app/views/login/login_view.dart';
//===============================================================

void signOut() {
  CacheHelper.removeData(key: TOKEN).then((value) {
    if (value) {
      MagicRouter.navigateAndPopAll(LoginView());
    }
  });
}
//===============================================================

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
