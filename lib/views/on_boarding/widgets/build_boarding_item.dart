import 'package:flutter/material.dart';

import '../../../models/boarding_model.dart';

Column buildBoardingItem(int index) {
  return Column(
    children: <Widget>[
      Expanded(
        child: Image(
          image: AssetImage(boardingData[index].imagePath),
        ),
      ),
      SizedBox(height: 20.0),
      Text(
        boardingData[index].title.toString(),
        style: TextStyle(fontSize: 24.0),
      ),
      SizedBox(height: 30.0),
      Text(
        boardingData[index].subTitle.toString(),
        style: TextStyle(fontSize: 18.0),
      ),
    ],
  );
}
