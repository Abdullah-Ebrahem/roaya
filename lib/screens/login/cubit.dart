import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec_project/core/cache_helper.dart';
import 'package:sec_project/screens/login/model.dart';
import 'package:sec_project/screens/login/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginIntialState());

  static LoginCubit getObject(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingeState());
      try {
        final response =
            await Dio(BaseOptions(receiveDataWhenStatusError: true))
                .post('https://roaya-lab.onrender.com/login', data: {
          'email': emailController.text,
          'password': passwordController.text
        });
        final data = UserLogin.fromJson(response.data);
        if (response.statusCode == 200) {
          emit(LoginSuccessState(msg: 'Success'));
          CacheHeper.saveName(name: data.user.firstName);
          CacheHeper.saveLastName(lastName: data.user.lastName);
          CacheHeper.saveEmail(email: data.user.email);
          CacheHeper.saveToken(token: data.token);
          CacheHeper.saveNotFirstTime();
        }
      } on DioException catch (e) {
        if (e.response != null) {
          emit(LoginFailedeState(msg: e.response!.data['message'].toString()));
        } else {
          emit(LoginFailedeState(msg: 'Network Error'));
        }
      }
    }
  }
}
