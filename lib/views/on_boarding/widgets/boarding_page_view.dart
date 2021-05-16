import 'package:flutter/material.dart';

import '../../../models/boarding_model.dart';
import 'build_boarding_item.dart';

class BoardingPageView extends StatefulWidget {
  @override
  _BoardingPageViewState createState() => _BoardingPageViewState();
}

class _BoardingPageViewState extends State<BoardingPageView> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: boardingData.length,
      onPageChanged: (int index) {
        if (index == boardingData.length - 1) {
          setState(() {
            isLast = true;
          });
        } else {
          setState(() {
            isLast = false;
          });
        }
      },
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => buildBoardingItem(index),
    );
  }
}
