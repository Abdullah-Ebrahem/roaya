import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sec_project/core/button.dart';
import 'package:sec_project/core/input.dart';
import 'package:sec_project/core/methods.dart';
import 'package:sec_project/screens/login/bloc/login_bloc.dart';
import 'package:sec_project/screens/master/view.dart';
import 'package:sec_project/screens/register/view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (context) => LoginCubit(),
      create: (context) => LoginBloc(),
      child: Builder(builder: (context) {
        // final cubit = LoginCubit.getObject(context);
        final bloc = LoginBloc.getObject(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: bloc.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                // List [  ]
                children: [
                  SizedBox(
                    height: 150.h,
                  ),
                  Text(
                    'Login',
                    style:
                        TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 41.h,
                  ),
                  Input(
                    title: 'Email',
                    controller: bloc.emailController,
                    keyBoardType: TextInputType.emailAddress,
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
                    title: 'Password',
                    controller: bloc.passwordController,
                    keyBoardType: TextInputType.visiblePassword,
                    isLast: true,
                    isPassword: true,
                    bottomMargin: 21.h,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                  BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginFState) {
                        showMessage(msg: state.msg);
                      }
                      if (state is LoginSState) {
                        navigateTo(page: const MasterPage());
                      }
                    },
                    builder: (context, state) {
                      if (state is LoginLState) {
                        return const CircularProgressIndicator();
                      }
                      return MyButton(
                        text: 'Login',
                        onPress: () {
                          bloc.login(context);
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 29.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: const Color(0xff898989),
                        width: 80.41.w,
                        height: 1.h,
                        margin: EdgeInsetsDirectional.only(end: 16.w),
                      ),
                      Text(
                        'Social Logins',
                        style: TextStyle(
                            color: const Color(0xff5A5A5A), fontSize: 14.sp),
                      ),
                      Container(
                        color: const Color(0xff898989),
                        width: 80.41.w,
                        height: 1.h,
                        margin: EdgeInsetsDirectional.only(start: 16.w),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 22.r,
                        backgroundColor: const Color(0xffFFBB3B),
                        child: Text(
                          'f',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 25.4.w,
                      ),
                      CircleAvatar(
                        radius: 22.r,
                        backgroundColor: const Color(0xffFFBB3B),
                        child: Text(
                          'G',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    'Don’t have an account?',
                    style: TextStyle(
                        color: const Color(0xff6F6F6F),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  TextButton(
                      onPressed: () {
                        navigateTo(page: const RegisterPage());
                      },
                      child: Text(
                        'REGISTER',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff5A5A5A)),
                      ))
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
