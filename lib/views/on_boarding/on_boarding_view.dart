import 'package:flutter/material.dart';
import 'package:shop_app/models/boarding_model.dart';
import 'package:shop_app/views/on_boarding/widgets/next_button.dart';
import 'package:shop_app/views/on_boarding/widgets/page_view_indicator.dart';
import 'widgets/boarding_page_view.dart';

class OnBoardingView extends StatefulWidget {
  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: submit,
            child: Text('Skip'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: BoardingPageView(),
            ),
            SizedBox(height: 40.0),
            PageViewIndicator(),
            NextButton(),
          ],
        ),
      ),
    );
  }
}
