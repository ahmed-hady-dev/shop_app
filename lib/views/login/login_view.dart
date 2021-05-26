import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/cacheHelper/cache_helper.dart';
import 'package:shop_app/core/constants.dart';
import 'package:shop_app/core/router/router.dart';
import 'package:shop_app/views/login/cubit/login_cubit.dart';
import 'package:shop_app/widgets/emailTextFormField.dart';
import 'package:shop_app/views/login/widgets/login_page_title.dart';
import 'package:shop_app/views/login/widgets/register_button.dart';
import 'package:shop_app/views/shop/shop_view.dart';
import 'package:shop_app/widgets/customButton.dart';
import 'package:shop_app/widgets/passwordTextField.dart';
import 'package:shop_app/widgets/show_toast.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
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
          GlobalKey<FormState> formKey = GlobalKey<FormState>();
          TextEditingController passwordController = TextEditingController();
          TextEditingController emailController = TextEditingController();
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        LoginPageTitle(),
                        emailTextFormField(emailController),
                        SizedBox(height: 20),
                        passwordTextFormField(
                            passwordController: passwordController,
                            suffix: LoginCubit.get(context).suffix,
                            isPassword: LoginCubit.get(context).isPassword,
                            suffixPressed: () {
                              LoginCubit.get(context)
                                  .changePasswordVisibility();
                            },
                            onSubmit: (value) {
                              if (formKey.currentState.validate()) {
                                LoginCubit.get(context).userLogin(
                                  email: emailController.value.text,
                                  password: passwordController.value.text,
                                );
                              }
                            }),
                        SizedBox(height: 25.0),
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                          builder: (context) => customButton(
                              function: () {
                                if (formKey.currentState.validate()) {
                                  LoginCubit.get(context).userLogin(
                                    email: emailController.value.text,
                                    password: passwordController.value.text,
                                  );
                                }
                              },
                              text: 'Login'),
                        ),
                        SizedBox(height: 15.0),
                        RegisterButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
