import 'package:final_project/configs/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/// about section.
/// used in drawer.dart
class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        "About",
        style: TextStyle(
            color: whiteColor, fontWeight: FontWeight.w400, fontSize: 18.sp),
      ),
      onTap: () {
        // pop this drawer.
        Navigator.pop(context);

        /// open about dialog box.
        showAboutDialog(
            context: context,
            applicationName: 'CS50x unofficial',
            applicationLegalese:
                "This is an unofficial app for the course CS50’s Introduction "
                "to Computer Science offered by Harvard University.\n\n"
                "Official course webpage is https://cs50.harvard.edu/x/2022/\n\n"
                "Made by Pratik Aman\n"
                "pratikaman.atom@gmail.com");
      },
    );
  }
}
