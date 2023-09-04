import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sec_project/core/cache_helper.dart';
import 'package:sec_project/core/methods.dart';
import 'package:sec_project/screens/login/view.dart';
import 'package:sec_project/screens/master/view.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  // refresh time
// true?aaaaa:bbbbb
  void initState() {
    Timer(const Duration(seconds: 3), () {
      navigateTo(
          withHistory: false,
          page: CacheHeper.getFirstTime()
              ? const LoginPage()
              : const MasterPage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text(
            'roaya'.toUpperCase(),
            style: TextStyle(
                fontSize: 45.sp,
                color: Theme.of(context).primaryColor,
                letterSpacing: 5.w,
                fontWeight: FontWeight.w500),
          ),
        ));
  }
}
