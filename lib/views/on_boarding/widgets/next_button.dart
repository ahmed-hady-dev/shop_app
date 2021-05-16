import 'package:flutter/material.dart';
import 'package:shop_app/models/boarding_model.dart';

class NextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Spacer(),
        FloatingActionButton(
            onPressed: () {
              if (isLast) {
                submit();
              } else {
                pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.decelerate);
              }
            },
            child: Icon(Icons.arrow_forward_ios))
      ],
    );
  }
}
