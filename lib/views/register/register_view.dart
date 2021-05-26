import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/cacheHelper/cache_helper.dart';
import 'package:shop_app/core/constants.dart';
import 'package:shop_app/core/router/router.dart';
import 'package:shop_app/views/register/widgets/cubit/register_cubit.dart';
import 'package:shop_app/views/shop/shop_view.dart';
import 'package:shop_app/widgets/customTextFormField.dart';
import 'package:shop_app/widgets/emailTextFormField.dart';
import 'package:shop_app/views/register/widgets/register_page_title.dart';
import 'package:shop_app/widgets/customButton.dart';
import 'package:shop_app/widgets/passwordTextField.dart';
import 'package:shop_app/widgets/show_toast.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {
            if (state is RegisterSuccessState) {
              if (state.loginModel.status) {
                CacheHelper.saveData(
                        key: TOKEN, value: state.loginModel.data.token)
                    .then((value) {
                  token = state.loginModel.data.token;
                  MagicRouter.navigateAndPopAll(ShopView());
                });
              } else {
                showToast(
                    text: state.loginModel.message, state: ToastStates.ERROR);
              }
            }
          },
          builder: (context, state) {
            var registerCubit = RegisterCubit.get(context);
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RegisterPageTitle(),
                        customTextFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter user name';
                            }
                          },
                          label: 'User Name',
                          prefix: Icons.person,
                        ),
                        SizedBox(height: 20),
                        emailTextFormField(emailController),
                        SizedBox(height: 20),
                        passwordTextFormField(
                            passwordController: passwordController,
                            suffix: registerCubit.suffix,
                            isPassword: registerCubit.isPassword,
                            suffixPressed: () {
                              registerCubit.changePasswordVisibility();
                            },
                            onSubmit: (value) {
                              if (formKey.currentState.validate()) {
                                registerCubit.userRegister(
                                    email: emailController.value.text,
                                    password: passwordController.value.text,
                                    name: nameController.value.text,
                                    phone: phoneController.value.text);
                              }
                            }),
                        SizedBox(height: 20),
                        customTextFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your phone number';
                            }
                          },
                          label: 'Phone',
                          prefix: Icons.phone,
                        ),
                        SizedBox(height: 25.0),
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                          builder: (context) => customButton(
                              function: () {
                                if (formKey.currentState.validate()) {
                                  registerCubit.userRegister(
                                      email: emailController.value.text,
                                      password: passwordController.value.text,
                                      name: nameController.value.text,
                                      phone: phoneController.value.text);
                                }
                              },
                              text: 'Register'),
                        ),
                        SizedBox(height: 15.0),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
    ;
  }
}
