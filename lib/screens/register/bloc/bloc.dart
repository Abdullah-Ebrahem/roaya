import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sec_project/core/cache_helper.dart';
import 'package:sec_project/screens/register/model.dart';

part 'states.dart';
part 'events.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterState> {
  RegisterBloc() : super(RegisterIntialState()) {
    on<RegisterEvents>((event, emit) {
      if (event is RegisterLoadingEvent) {
        emit(RegisterLState());
      } else if (event is RegisterSuccesEvent) {
        emit(RegisterSState());
      } else if (event is RegisterFailedEvent) {
        emit(RegisterFState(msg: event.msg));
      } else if (event is RegisterImgSelectEvent) {
        emit(RegisterImgSelectState());
      }
    });
  }

  static RegisterBloc getObject(context) => BlocProvider.of(context);

  File? myImage;
  final _picker = ImagePicker();
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  void changeEvent(context, {required var event}) {
    BlocProvider.of<RegisterBloc>(context).add(event);
  }

  void chooseImg(context, {required ImageSource imageSource}) {
    _picker.pickImage(source: imageSource).then((value) {
      if (value != null) {
        myImage = File(value.path);
        changeEvent(context, event: RegisterImgSelectEvent());
      }
    });
  }

  void register(context) async {
    if (formKey.currentState!.validate()) {
      changeEvent(context, event: RegisterLoadingEvent());
      try {
        final response =
            await Dio(BaseOptions(receiveDataWhenStatusError: true))
                .post('https://roaya-lab.onrender.com/signUp', data: {
          "firstName": nameController.text,
          "lastName": lastNameController.text,
          "email": emailController.text,
          "password": passwordController.text,
          "confirmPassword": passwordConfirmController.text
        });
        final data = RegisterModel.fromJson(response.data);
        changeEvent(context, event: RegisterSuccesEvent());
        CacheHeper.saveName(name: data.firstName);
        CacheHeper.saveLastName(lastName: data.lastName);
        CacheHeper.saveEmail(email: data.email);
        CacheHeper.saveNotFirstTime();
      } on DioException catch (e) {
        if (e.response != null) {
          changeEvent(context,
              event: RegisterFailedEvent(msg: e.response!.data['message']));
        } else {
          changeEvent(context,
              event: RegisterFailedEvent(msg: 'Network Error'));
        }
      }
    }
  }
}
