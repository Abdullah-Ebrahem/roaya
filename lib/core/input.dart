import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Input extends StatefulWidget {
  final String title;
  final double? bottomMargin;
  final TextInputType? keyBoardType;
  final bool isPassword, isLast;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const Input({
    super.key,
    required this.title,
    this.bottomMargin,
    this.keyBoardType,
    this.isPassword = false,
    this.isLast = false,
    this.validator,
    this.controller,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 45.w),
          child: Text(
            widget.title,
            style: TextStyle(
                color: const Color(0xff5A5A5A),
                fontSize: 12.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
              start: 45.w, bottom: widget.bottomMargin ?? 25.h, end: 45.w),
          child: TextFormField(
            keyboardType: widget.keyBoardType,
            validator: widget.validator,
            controller: widget.controller,
            textInputAction:
                widget.isLast ? TextInputAction.done : TextInputAction.next,
            obscureText: widget.isPassword && isHidden,
            decoration: InputDecoration(
              errorStyle: TextStyle(fontSize: 13.sp),
              filled: true,
              fillColor: const Color(0xffF2F2F2),
              suffixIcon: widget.isPassword
                  ? GestureDetector(
                      onTap: () {
                        isHidden = !isHidden;
                        setState(() {});
                      },
                      child: Icon(isHidden
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined),
                    )
                  : const SizedBox.shrink(),
              contentPadding: EdgeInsetsDirectional.only(
                  top: 12.h, bottom: 8.h, start: 20.w),
              hintText: '${widget.title.toLowerCase()} here',
              hintStyle:
                  TextStyle(fontSize: 17.sp, color: const Color(0xffA2A2A2)),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(9.r)),
            ),
          ),
        )
      ],
    );
  }
}
