part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginLoadingEvent extends LoginEvent {}

class LoginFailedEvent extends LoginEvent {
  final String msg;
  LoginFailedEvent({required this.msg});
}

class LoginSuccessEvent extends LoginEvent {
  final String msg;
  LoginSuccessEvent({required this.msg});
}
