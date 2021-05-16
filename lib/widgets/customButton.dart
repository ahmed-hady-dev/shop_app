import 'package:flutter/material.dart';
import 'package:shop_app/core/router/router.dart';

Widget customButton({
  double width = double.infinity,
  Color background = Colors.indigo,
  bool isUpperCase = true,
  double radius = 3.0,
  @required Function function,
  @required String text,
}) {
  TextTheme textTheme = Theme.of(MagicRouter.currentContext).textTheme;
  return Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: textTheme.button,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ));
}
