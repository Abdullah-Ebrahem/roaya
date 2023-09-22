part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

class LoginInitial extends LoginState {}

class LoginLState extends LoginState {}

class LoginFState extends LoginState {
  final String msg;
  LoginFState({required this.msg});
}

class LoginSState extends LoginState {
  final String msg;
  LoginSState({required this.msg});
}
