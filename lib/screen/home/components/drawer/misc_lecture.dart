import 'package:final_project/configs/palette.dart';
import 'package:final_project/controller/home_controller.dart';
import 'package:final_project/controller/lecture_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// week lecture button for opening lecture.
/// used in drawer.dart
class MiscLecture extends ConsumerWidget {
  final int miscLectureIndex;
  final String lectureName;

  const MiscLecture(
      this.miscLectureIndex,
      this.lectureName,
      {
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: GestureDetector(
        child: Text(
          lectureName,
          style: TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.w400,
              fontSize: 18.sp),
        ),
        onTap: () {
          /// update the selected tab index to lecture tab.
          ref.read(homeProvider).updateSelectedIndex(1);

          /// open the lecture tab.
          ref.read(homeProvider).pageController.animateToPage(ref.watch(homeProvider).selectedTab,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);

          /// load the lecture in youtube player in lecture tab.
          ref.read(lectureProvider).viewMiscLecture(lectureName, miscLectureIndex);

          /// pop this drawer.
          Navigator.pop(context);
        },
      ),
    );
  }
}
