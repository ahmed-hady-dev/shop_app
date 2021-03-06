import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/core/dioHelper/dio_helper.dart';
import 'package:shop_app/core/constants.dart';
import 'package:shop_app/models/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel loginModel;

  void userLogin({
    @required String email,
    @required String password,
  }) async {
    emit(LoginLoadingState());

    var response = await DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    );
    try {
      print(response.data);
      loginModel = LoginModel.fromJson(response.data);
      emit(LoginSuccessState(loginModel));
    } catch (error) {
      print(response.data);
      loginModel = LoginModel.fromJson(response.data);
      print(loginModel.message);
      emit(LoginErrorState(error.toString()));
    }
  }

//===============================================================
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(LoginChangePasswordVisibilityState());
  }
}
