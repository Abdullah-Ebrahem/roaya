import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sec_project/core/cache_helper.dart';
import 'package:sec_project/screens/register/model.dart';
import 'package:sec_project/screens/register/states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterIntialState());

  static RegisterCubit getObject(context) => BlocProvider.of(context);
  File? myImage;
  final _picker = ImagePicker();
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  void chooseImg({required ImageSource imageSource}) {
    _picker.pickImage(source: imageSource).then((value) {
      if (value != null) {
        myImage = File(value.path);
        emit(RegisterImgChangeState());
      }
    });
  }

  void register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingeState());
      try {
        final response = await Dio(BaseOptions(
          receiveDataWhenStatusError: true,
        )).post('https://roaya-lab.onrender.com/signUp', data: {
          "firstName": nameController.text,
          "lastName": lastNameController.text,
          "email": emailController.text,
          "password": passwordController.text,
          "confirmPassword": passwordConfirmController.text
        });
        final data = RegisterModel.fromJson(response.data);
        if (response.statusCode == 200) {
          emit(RegisterSuccessState(msg: 'Success'));
          CacheHeper.saveName(name: data.firstName);
          CacheHeper.saveLastName(lastName: data.lastName);
          CacheHeper.saveEmail(email: data.email);
          CacheHeper.saveNotFirstTime();
        }
      } on DioException catch (e) {
        if (e.response != null) {
          emit(RegisterFailedeState(
              msg: e.response!.data['message'].toString()));
        } else {
          emit(RegisterFailedeState(msg: 'Network Error'));
        }
      }
    }
  }
}
