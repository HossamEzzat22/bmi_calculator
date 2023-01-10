import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:session5_task/components/reuseable_button_next_step_type.dart';
import 'package:session5_task/config/toast_config.dart';
import 'package:session5_task/enums/toast_states.dart';
import 'package:session5_task/screens/gender_type_screen.dart';
import 'package:session5_task/screens/male_person_height.dart';
import 'package:session5_task/services/sharedpreferences_helper.dart';
import 'package:session5_task/services/sharedpreferences_keys.dart';
import 'package:session5_task/utils/app_navigator.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';
import '../components/reusable_button_measure_types.dart';
import '../src/app_colors.dart';
import 'bmi_result.dart';

class PersonWeight extends StatefulWidget {
  final height ;


  PersonWeight({required this.height});

  @override
  State<PersonWeight> createState() => _PersonWeightState();
}

class _PersonWeightState extends State<PersonWeight> {
  bool isMeters = true ;
  late WeightSliderController _controller;
  double _weight = 30.0;
  double result = 0;



  @override
  void initState() {
    super.initState();
    _controller = WeightSliderController(initialWeight: _weight, minWeight: 0, interval: 0.1);
  }

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
                  'WEIGHT',
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
                ReuseableButton(text: 'KGS', color:  isMeters ?AppColors.darkblue : Colors.white),
                SizedBox(
                  width: 5.w,
                ),
                ReuseableButton(text: 'LBS', color:  !isMeters ?AppColors.darkblue : Colors.white)
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${_weight}',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'KG',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 350,
              child: VerticalWeightSlider(
                controller: _controller,
                decoration: const PointerDecoration(
                  width: 130.0,
                  height: 4.0,
                  largeColor: Color(0xFF898989),
                  mediumColor: Color(0xFFC5C5C5),
                  smallColor: Color(0xFFF0F0F0),
                  gap: 30.0,
                ),
                onChanged: (double value) {
                  setState(() {
                    _weight = value;
                  });
                },
                indicator: Container(
                  height: 3.0,
                  width: 200.0,
                  alignment: Alignment.centerLeft,
                  color: Colors.red[300],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                AppNavigator(context, false, GenderTypeScreen());
              },
                child: UserNextStep(text: 'Back', height: 40, textColor: AppColors.greyColor, width: 300, containerColor: Colors.white, postfexicon: Icons.arrow_back_outlined, prefexicon: null)),
            SizedBox(
              height: 15.h,
            ),
            GestureDetector(
                onTap: (){
                  result = (_weight/(widget.height*widget.height))*10000;
                  SharedPrefrenceHelper.saveData(key: SharedPreferenceKeys.resultKey, value: result);
                  ToastConfig.showToast(msg: 'Your Result', toastStates: ToastStates.Success);
              AppNavigator(context, false, BmiResults());
            },
                child: UserNextStep(text: 'Calculate BMI', height: 40, textColor: Colors.white, width: 300, containerColor: AppColors.darkblue, postfexicon: null, prefexicon: null,))
          ],
        ),
      ),
    );
  }

}
