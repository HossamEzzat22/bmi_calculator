import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/colors_generator.dart';
import '../screens/gender_type_screen.dart';
import '../screens/male_person_height.dart';
import '../screens/person_weight.dart';

class AppRoot extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context , child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: ColorsGeneratorScreen(),
          );
        }
        );
  }
}
