import 'package:flutter/material.dart';
import 'package:shop_app/core/router/router.dart';
import 'package:shop_app/views/register/register_view.dart';

class RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have account'),
        TextButton(
          onPressed: () {
            MagicRouter.navigateTo(RegisterView());
          },
          child: Text('Register Now'),
        ),
      ],
    );
  }
}
