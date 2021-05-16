import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'LOGIN',
          style: textTheme.headline5,
        ),
        Text(
          'Login now to browse our hot offers',
          style: textTheme.bodyText1.copyWith(color: Colors.grey),
        ),
        SizedBox(height: 30)
      ],
    );
  }
}
