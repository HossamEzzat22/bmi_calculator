import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:session5_task/components/gender_card.dart';
import 'package:session5_task/screens/male_person_height.dart';
import 'package:session5_task/src/app_colors.dart';
import 'package:session5_task/config/size_config.dart';
import 'package:session5_task/utils/app_navigator.dart';

import 'female_person_height.dart';

class GenderTypeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SELECT YOUR ',
                    style: TextStyle(
                      fontSize: 25.sp,
                    ),
                  ),
                  Text(
                    'GENDER',
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: (){
                  AppNavigator(context, false, MalePersonHeight());
                },
                  child:
                  GenderCard(image: 'assets/images/male5.png', type: 'MALE')
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: (){
                  AppNavigator(context, false, FemalePersonHeight());
                },
                  child: GenderCard(image: 'assets/images/female2.png', type: 'FEMALE')),

            ],
          ),
        ),
      ),
    );
  }
}
