import 'package:flutter/material.dart';
import 'package:shop_app/core/cacheHelper/cache_helper.dart';
import 'package:shop_app/core/constants.dart';
import 'package:shop_app/core/router/router.dart';
import 'package:shop_app/views/login/login_view.dart';

class BoardingModel {
  final String imagePath;
  final String title;
  final String subTitle;

  BoardingModel({this.imagePath, this.title, this.subTitle});
}

List<BoardingModel> boardingData = [
  BoardingModel(
      imagePath: 'assets/images/onboard_1.png',
      title: 'On Boarding 1 Title',
      subTitle: 'On Boarding 1 Subtitle'),
  BoardingModel(
      imagePath: 'assets/images/onboard_2.png',
      title: 'On Boarding 2 Title',
      subTitle: 'On Boarding 2 Subtitle'),
  BoardingModel(
      imagePath: 'assets/images/onboard_3.png',
      title: 'On Boarding 3 Title',
      subTitle: 'On Boarding 3 Subtitle'),
];
bool isLast = false;
var pageController = PageController();

void submit() {
  CacheHelper.saveData(key: ONBOARDING, value: true).then((value) {
    MagicRouter.navigateAndPopAll(LoginView());
  });

  // void submit() async {
  // var onBoarding = await CacheHelper.saveData(key: 'onBoarding', value: true);
  // if (onBoarding) {
  //   MagicRouter.navigateAndPopAll(LoginView());
  // } else {
  //   pageController.nextPage(
  //       duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  // }
}
