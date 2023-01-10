import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderCard extends StatelessWidget {
  String image ;
  String type ;


  GenderCard({required this.image,required this.type});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 15,
      child: Container(
        height: 200.h,
        width: 200.w,
        child: Column(
          children: [
            Image(
              image:AssetImage(image),
              height: 150.h,
              width: 150.w,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              type,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            )
          ],
        ),
      ),
    );
  }
}
