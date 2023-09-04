import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function() onPress;
  const MyButton({super.key, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 45.w, end: 45.w),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffFFBB3B),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9.r)),
              fixedSize: Size(MediaQuery.of(context).size.width, 44.h)),
          onPressed: onPress,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          )),
    );
  }
}
