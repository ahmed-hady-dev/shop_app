import 'package:flutter/material.dart';
import 'package:shop_app/widgets/customTextFormField.dart';

Widget emailTextFormField(TextEditingController emailController) {
  return customTextFormField(
    controller: emailController,
    type: TextInputType.emailAddress,
    validate: (String value) {
      if (value.isEmpty) {
        return 'please enter your email address';
      }
    },
    label: 'Email address',
    prefix: Icons.email_outlined,
  );
}
