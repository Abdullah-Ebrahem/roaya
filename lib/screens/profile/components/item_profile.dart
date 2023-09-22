import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemProfile extends StatelessWidget {
  final String title;
  final IconData? icon;
  const ItemProfile({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 10.h),
      child: Chip(
        side: BorderSide.none,
        padding: EdgeInsetsDirectional.only(start: 5.w),
        label: Text(
          title,
          style: TextStyle(fontSize: 18.sp, color: Colors.white),
        ),
        avatar: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
