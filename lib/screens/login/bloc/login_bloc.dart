import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec_project/core/cache_helper.dart';
import 'package:sec_project/screens/login/model.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      if (event is LoginLoadingEvent) {
        emit(LoginLState());
      } else if (event is LoginFailedEvent) {
        emit(LoginFState(msg: event.msg));
      } else if (event is LoginSuccessEvent) {
        emit(LoginSState(msg: event.msg));
      }
    });
  }

  static LoginBloc getObject(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login(context) async {
    BlocProvider.of<LoginBloc>(context).add(LoginLoadingEvent());
    if (formKey.currentState!.validate()) {
      try {
        final response =
            await Dio(BaseOptions(receiveDataWhenStatusError: true))
                .post('https://roaya-lab.onrender.com/login', data: {
          'email': emailController.text,
          'password': passwordController.text
        });
        final data = UserLogin.fromJson(response.data);
        BlocProvider.of<LoginBloc>(context)
            .add(LoginSuccessEvent(msg: 'Success'));
        CacheHeper.saveName(name: data.user.firstName);
        CacheHeper.saveLastName(lastName: data.user.lastName);
        CacheHeper.saveEmail(email: data.user.email);
        CacheHeper.saveToken(token: data.token);
        CacheHeper.saveNotFirstTime();
      } on DioException catch (e) {
        if (e.response != null) {
          BlocProvider.of<LoginBloc>(context)
              .add(LoginFailedEvent(msg: e.response!.data['message']));
        } else {
          BlocProvider.of<LoginBloc>(context)
              .add(LoginFailedEvent(msg: 'Network Error'));
        }
      }
    }
  }
}
