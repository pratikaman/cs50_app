import 'package:final_project/configs/palette.dart';
import 'package:final_project/configs/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/// course name and short description
/// used in drawer.dart
class IntroCard extends StatelessWidget {
  const IntroCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appName,
          style: TextStyle(
              color: whiteColor ,
              fontWeight: FontWeight.w600,
              fontSize: 34.sp),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          appDescription,
          style: TextStyle(
              color: whiteColor ,
              fontWeight: FontWeight.w400,
              fontSize: 20.sp),
        ),
        SizedBox(
          height: 2.h,
        ),

      ],
    );
  }
}