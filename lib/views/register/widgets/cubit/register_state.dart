part of 'register_cubit.dart';

@immutable
abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final LoginModel loginModel;

  RegisterSuccessState(this.loginModel);
}

class RegisterErrorState extends RegisterStates {
  final String error;

  RegisterErrorState(this.error);
}

class RegisterChangePasswordVisibilityState extends RegisterStates {}
