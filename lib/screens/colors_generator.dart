import 'package:flutter/material.dart';
import 'package:session5_task/components/my_generate_color_button.dart';
import 'package:session5_task/services/sharedpreferences_helper.dart';
import 'package:session5_task/services/sharedpreferences_keys.dart';
import 'package:session5_task/src/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:session5_task/config/size_config.dart';
import 'dart:math';


class ColorsGeneratorScreen extends StatefulWidget {


  @override
  State<ColorsGeneratorScreen> createState() => _ColorsGeneratorScreenState();
}

class _ColorsGeneratorScreenState extends State<ColorsGeneratorScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedPrefrenceHelper.getData(key: SharedPreferenceKeys.randomColorKey)??AppColors.lightBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              alignment: Alignment.centerLeft,
              width: 300.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.greyColor, width: 2.w),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  '${SharedPrefrenceHelper.getData(key: SharedPreferenceKeys.randomColorKey)}'??"",
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          myButton(
              text: 'Generator Color',
              function: (){
                setState(() {
                  final list = List<int>.generate(36, (i) => generateRandomCode(0xFF0587D8, 0xFF0345B5));
                  final colorList = list.map((hex) => Color(hex)).toList();
                  SharedPrefrenceHelper.saveData(key: SharedPreferenceKeys.randomColorKey, value: colorList[0]);
                  print(colorList[0]);
                });
              }
              )
        ],
      ),
    );
  }
  int generateRandomCode(int minValue, int maxValue) {
    return Random().nextInt((maxValue - minValue).abs() + 1) + min(minValue, maxValue);

  }

//   colorGenerator() {
//
//
//     const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
//     Random _rnd = Random();
//
//     String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
//         length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
// setState(() {
//   randomColor = getRandomString(5);
//
// });  }
}
