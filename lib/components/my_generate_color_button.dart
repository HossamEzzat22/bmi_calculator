import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../src/app_colors.dart';

class myButton extends StatelessWidget {
  final text;
  final function;


  myButton({required this.text,required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        width: 200.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.greyColor, width: 2.w),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
