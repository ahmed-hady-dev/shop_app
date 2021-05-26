import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/functions/sign_out.dart';
import 'package:shop_app/views/shop/cubit/shop_cubit.dart';
import 'package:shop_app/widgets/customButton.dart';
import 'package:shop_app/widgets/customTextFormField.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {
          if (state is ShopSuccessGetUserDataState) {
            nameController.text = state.loginModel.data.name;
            emailController.text = state.loginModel.data.email;
            phoneController.text = state.loginModel.data.phone;
          }
        },
        builder: (context, state) {
          var model = ShopCubit.get(context).userModel;
          nameController.text = model.data.name;
          emailController.text = model.data.email;
          phoneController.text = model.data.phone;
          return ConditionalBuilder(
            condition: model != null,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (state is ShopLoadingUpdateUserDataState)
                        LinearProgressIndicator(),
                      SizedBox(
                        height: 20,
                      ),
                      customTextFormField(
                        controller: nameController,
                        type: TextInputType.name,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'name must not be empty';
                          }
                          return null;
                        },
                        label: 'Name',
                        prefix: Icons.person,
                      ),
                      SizedBox(height: 20.0),
                      customTextFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'email must not be empty';
                          }
                          return null;
                        },
                        label: 'Email',
                        prefix: Icons.email,
                      ),
                      SizedBox(height: 20.0),
                      customTextFormField(
                        controller: phoneController,
                        type: TextInputType.phone,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'phone number must not be empty';
                          }
                          return null;
                        },
                        label: 'Phone Number',
                        prefix: Icons.phone,
                      ),
                      SizedBox(height: 20.0),
                      customButton(
                          function: () {
                            if (formKey.currentState.validate()) {
                              ShopCubit.get(context).updateUserData(
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                              );
                            }
                          },
                          text: 'UPDATE'),
                      SizedBox(height: 20.0),
                      customButton(function: signOut, text: 'LOG OUT'),
                    ],
                  ),
                ),
              ),
            ),
            fallback: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
