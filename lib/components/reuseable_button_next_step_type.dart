import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../src/app_colors.dart';

class UserNextStep extends StatelessWidget {
  String text;
  Color containerColor;
  Color textColor;
  double width;
  double height;
  IconData? postfexicon = null;
  IconData? prefexicon = null;




  UserNextStep({required this.text,required this.postfexicon,required this.prefexicon,required this.height,required this.textColor,required this.width,required this.containerColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyColor),
          borderRadius: BorderRadius.circular(10),
          color: containerColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            postfexicon,
            color: AppColors.greyColor,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Icon(
            prefexicon,
            color: Colors.white,
          ),

        ],
      ),
    );
  }
}
