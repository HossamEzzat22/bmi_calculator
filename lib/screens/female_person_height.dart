import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:session5_task/components/reusable_button_measure_types.dart';
import 'package:session5_task/components/reuseable_button_next_step_type.dart';
import 'package:session5_task/screens/gender_type_screen.dart';
import 'package:session5_task/screens/person_weight.dart';
import 'package:session5_task/utils/app_navigator.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../src/app_colors.dart';

class FemalePersonHeight extends StatefulWidget {


  @override
  State<FemalePersonHeight> createState() => _PersonHeightState();
}

class _PersonHeightState extends State<FemalePersonHeight> {

  double height = 40;
  bool isMeters = true ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
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
                  'HEIGHT',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReuseableButton(text: 'Meters', color:  isMeters ?AppColors.darkblue : Colors.white),
                SizedBox(
                  width: 5.w,
                ),
                ReuseableButton(text: 'Feets', color:  !isMeters ?AppColors.darkblue : Colors.white)
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: height,
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage('https://img.freepik.com/free-vector/muslim-woman-cartoon-character-sticker-white-background_1308-73435.jpg'),
                    ),
                  ),
                  Container(
                    height: 400.h,
                    child: SfSlider.vertical(
                      min: 40.0,
                      max: 220.0,
                      value: height,
                      interval: 10,
                      showTicks: true,
                      showLabels: true,
                      enableTooltip: true,
                      minorTicksPerInterval: 1,
                      onChanged: (dynamic value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ),
                ],
              ),

            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: (){
                      AppNavigator(context, false, GenderTypeScreen());
                    },
                    child: UserNextStep(text: 'BACK', containerColor: Colors.white, textColor: AppColors.greyColor, height: 40.h, width: 130.w, prefexicon: null, postfexicon: Icons.arrow_back_outlined,)),
                SizedBox(
                  width: 15.w,
                ),
                GestureDetector(
                    onTap: (){
                      AppNavigator(context, false, PersonWeight(height: height,));
                    },
                    child: UserNextStep(text: 'NEXT', containerColor: AppColors.darkblue, textColor: Colors.white, height: 40.h, width: 130.w, prefexicon: Icons.arrow_forward_outlined, postfexicon: null,))
              ],
            )
          ],
        ),
      ),
    );
  }
}
