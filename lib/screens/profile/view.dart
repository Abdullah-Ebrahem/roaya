import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sec_project/core/cache_helper.dart';
import 'package:sec_project/core/methods.dart';
import 'package:sec_project/screens/login/view.dart';
import 'package:sec_project/screens/profile/components/item_profile.dart';
import 'package:sec_project/screens/profile/controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProfileController();
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 10,
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
              ItemProfile(
                  title: controller.titles[0], icon: controller.icons[0]),
              ItemProfile(
                  title: controller.titles[1], icon: controller.icons[1]),
              GestureDetector(
                  onTap: () {
                    CacheHeper.clear();
                    navigateTo(page: const LoginPage(), withHistory: false);
                  },
                  child: ItemProfile(
                      title: controller.titles[2], icon: controller.icons[2])),
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
