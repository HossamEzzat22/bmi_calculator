import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:session5_task/src/app_colors.dart';

class ReuseableButton extends StatefulWidget {

  String text ;
  Color color ;

  ReuseableButton({required this.color,required this.text});

  @override
  State<ReuseableButton> createState() => _ReuseableButtonState();
}

class _ReuseableButtonState extends State<ReuseableButton> {

  bool isMeters = true ;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
      color: widget.color,
      onPressed: (){
        
      },
      child: Text(
        widget.text,
        style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
      ),
    );
  }
}
