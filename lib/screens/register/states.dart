abstract class RegisterStates {}

class RegisterIntialState extends RegisterStates {}

class RegisterImgChangeState extends RegisterStates {}

class RegisterLoadingeState extends RegisterStates {}

class RegisterFailedeState extends RegisterStates {
  final String msg;
  RegisterFailedeState({required this.msg});
}

class RegisterSuccessState extends RegisterStates {
  final String msg;
  RegisterSuccessState({required this.msg});
}
