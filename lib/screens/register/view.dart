import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sec_project/core/button.dart';
import 'package:sec_project/core/input.dart';
import 'package:sec_project/core/methods.dart';
import 'package:sec_project/screens/master/view.dart';
import 'package:sec_project/screens/register/cubit.dart';
import 'package:sec_project/screens/register/states.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Builder(builder: (context) {
        final cubit = RegisterCubit.getObject(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Back',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff7C7C7C)),
            ),
            leadingWidth: 25.w,
            leading: Padding(
              padding: EdgeInsetsDirectional.only(start: 5.w),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 17.sp,
                    color: const Color(0xff7C7C7C),
                  )),
            ),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: cubit.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  SizedBox(
                    height: 9.h,
                  ),
                  BlocBuilder<RegisterCubit, RegisterStates>(
                    builder: (context, state) => CircleAvatar(
                      radius: 50.r,
                      backgroundImage: cubit.myImage != null
                          ? FileImage(cubit.myImage!) as ImageProvider
                          : const AssetImage('assets/images/photo.png'),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(28),
                                topEnd: Radius.circular(28))),
                        context: context,
                        builder: (context) => Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.all(15.0.w),
                              child: Text(
                                'Choose Image',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xffFFBB3B)),
                                    onPressed: () {
                                      cubit.chooseImg(
                                          imageSource: ImageSource.gallery);
                                    },
                                    icon: const Icon(Icons.image),
                                    label: Text(
                                      'Gallery',
                                      style: TextStyle(fontSize: 15.sp),
                                    )),
                                ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xffFFBB3B)),
                                    onPressed: () {
                                      cubit.chooseImg(
                                          imageSource: ImageSource.camera);
                                    },
                                    icon: const Icon(Icons.camera_alt),
                                    label: Text(
                                      'Camera',
                                      style: TextStyle(fontSize: 15.sp),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            )
                          ],
                        ),
                      );
                    },
                    child: Text(
                      'Add profile picture',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff5A5A5A)),
                    ),
                  ),
                  SizedBox(
                    height: 44.h,
                  ),
                  Input(
                    title: 'FIRST NAME',
                    keyBoardType: TextInputType.name,
                    controller: cubit.nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                  ),
                  Input(
                    title: 'LAST NAME',
                    keyBoardType: TextInputType.name,
                    controller: cubit.lastNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Lastname is required';
                      }
                      return null;
                    },
                  ),
                  Input(
                    title: 'EMAIL',
                    keyBoardType: TextInputType.emailAddress,
                    controller: cubit.emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email is required';
                      } else if (!value.endsWith('@gmail.com')) {
                        return 'Email must ends with @gmail.com';
                      }
                      return null;
                    },
                  ),
                  Input(
                    title: 'PASSWORD',
                    keyBoardType: TextInputType.visiblePassword,
                    controller: cubit.passwordController,
                    isPassword: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                  Input(
                    title: 'CONFIRM PASSWORD',
                    keyBoardType: TextInputType.visiblePassword,
                    controller: cubit.passwordConfirmController,
                    isLast: true,
                    isPassword: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      } else if (value != cubit.passwordController.text) {
                        return 'Write the same password';
                      }
                      return null;
                    },
                  ),
                  BlocConsumer<RegisterCubit, RegisterStates>(
                      listener: (context, state) {
                    if (state is RegisterSuccessState) {
                      // showMessage(msg: state.msg);
                      navigateTo(page: const MasterPage(), withHistory: false);
                    }
                    if (state is RegisterFailedeState) {
                      showMessage(msg: state.msg);
                    }
                  }, builder: (context, state) {
                    if (state is RegisterLoadingeState) {
                      return const CircularProgressIndicator();
                    }
                    return MyButton(
                      text: 'REGISTER',
                      onPress: cubit.register,
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
