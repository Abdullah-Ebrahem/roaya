part of 'bloc.dart';

abstract class RegisterEvents {}

class RegisterSuccesEvent extends RegisterEvents {}

class RegisterImgSelectEvent extends RegisterEvents {}

class RegisterFailedEvent extends RegisterEvents {
  final String msg;
  RegisterFailedEvent({required this.msg});
}

class RegisterLoadingEvent extends RegisterEvents {}
