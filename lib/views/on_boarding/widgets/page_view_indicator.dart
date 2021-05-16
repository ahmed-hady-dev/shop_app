import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../models/boarding_model.dart';

class PageViewIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SmoothPageIndicator(
        controller: pageController,
        count: boardingData.length,
        effect: ExpandingDotsEffect(expansionFactor: 1.5),
      ),
    );
  }
}
