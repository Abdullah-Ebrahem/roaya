abstract class LoginStates {}

class LoginIntialState extends LoginStates {}

class LoginLoadingeState extends LoginStates {}

class LoginFailedeState extends LoginStates {
  final String msg;
  LoginFailedeState({required this.msg});
}

class LoginSuccessState extends LoginStates {
  final String msg;
  LoginSuccessState({required this.msg});
}
