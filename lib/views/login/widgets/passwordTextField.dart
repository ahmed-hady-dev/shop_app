import 'package:flutter/material.dart';
import 'package:shop_app/widgets/customTextFormField.dart';

Widget passwordTextFormField({
  TextEditingController passwordController,
  Function onSubmit,
  Function suffixPressed,
  IconData suffix,
  bool isPassword,
}) {
  return customTextFormField(
    prefix: Icons.lock_outlined,
    controller: passwordController,
    suffix: suffix,
    type: TextInputType.visiblePassword,
    suffixPressed: suffixPressed,
    onSubmit: onSubmit,
    isPassword: isPassword,
    validate: (String value) {
      if (value.isEmpty) {
        return 'please enter password';
      }
    },
    label: 'Password',
  );
}
