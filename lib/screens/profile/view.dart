import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sec_project/core/cache_helper.dart';
import 'package:sec_project/core/methods.dart';
import 'package:sec_project/screens/login/view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 10,
          color: Theme.of(context).primaryColor,
          margin: EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.r)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 10.h,
              ),
              Chip(
                padding: EdgeInsetsDirectional.only(start: 5.w),
                backgroundColor: Theme.of(context).primaryColor,
                label: Text(
                  '${CacheHeper.getFirstTime()} ${CacheHeper.getLastName()}',
                  style: TextStyle(fontSize: 18.sp, color: Colors.white),
                ),
                avatar: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              Chip(
                padding: EdgeInsetsDirectional.only(start: 5.w),
                backgroundColor: Theme.of(context).primaryColor,
                label: Text(
                  '${CacheHeper.getEmail()}',
                  style: TextStyle(fontSize: 18.sp, color: Colors.white),
                ),
                avatar: Icon(
                  Icons.email_rounded,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  CacheHeper.clear();
                  navigateTo(page: const LoginPage(), withHistory: false);
                },
                child: Chip(
                  padding: EdgeInsetsDirectional.only(start: 5.w),
                  backgroundColor: Theme.of(context).primaryColor,
                  label: Text(
                    'logout',
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                  avatar: Icon(
                    Icons.logout_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
