part of 'bloc.dart';

abstract class RegisterState {}

class RegisterIntialState extends RegisterState {}

class RegisterImgSelectState extends RegisterState {}

class RegisterSState extends RegisterState {}

class RegisterFState extends RegisterState {
  final String msg;
  RegisterFState({required this.msg});
}

class RegisterLState extends RegisterState {}
