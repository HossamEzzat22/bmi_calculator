import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:session5_task/config/toast_config.dart';
import 'package:session5_task/services/sharedpreferences_helper.dart';
import 'package:session5_task/services/sharedpreferences_keys.dart';

class BmiResults extends StatelessWidget {

  String state = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'YOUR BMI IS : ',
                  style: TextStyle(
                    fontSize: 15.sp,
                  ),
                ),
                Text(
                  '${SharedPrefrenceHelper.getData(key: SharedPreferenceKeys.resultKey)}',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'YOUR STATE IS : ',
                  style: TextStyle(
                    fontSize: 15.sp,
                  ),
                ),
                Container(
                  width: 150,
                  child: Text(
                    '${myBodyState(state)}',
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

   dynamic myBodyState(state){
    if(SharedPrefrenceHelper.getData(key: SharedPreferenceKeys.resultKey) >= 19 && SharedPrefrenceHelper.getData(key: SharedPreferenceKeys.resultKey)<=24.9){
      var state = 'healthy';
      return state ;
    }else if(SharedPrefrenceHelper.getData(key: SharedPreferenceKeys.resultKey) >= 25 && SharedPrefrenceHelper.getData(key: SharedPreferenceKeys.resultKey)<=29.9) {
      var state = 'Overweight, You should visit doctor';
      return state ;
    }else{
      var state = 'Obese,You should visit doctor';
      return state ;
    }
}
}
