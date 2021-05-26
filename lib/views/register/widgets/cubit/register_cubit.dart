import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/core/dioHelper/dio_helper.dart';
import 'package:shop_app/core/constants.dart';
import 'package:shop_app/core/router/router.dart';
import 'package:shop_app/models/login_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  LoginModel loginModel;

  //===============================================================

  void userRegister({
    @required String name,
    @required String email,
    @required String password,
    @required String phone,
  }) async {
    emit(RegisterLoadingState());

    var response = await DioHelper.postData(
      url: REGISTER,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    );
    try {
      print(response.data);
      loginModel = LoginModel.fromJson(response.data);
      ScaffoldMessenger.of(MagicRouter.currentContext)
          .showSnackBar(SnackBar(content: Text(response.data.toString())));
      emit(RegisterSuccessState(loginModel));
    } catch (error) {
      print(response.data);
      loginModel = LoginModel.fromJson(response.data);
      print(loginModel.message);
      emit(RegisterErrorState(error.toString()));
    }
  }

//===============================================================
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegisterChangePasswordVisibilityState());
  }
}
