import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'about.dart';
import 'david_malan_card.dart';
import 'intro_card.dart';
import 'lecture.dart';
import 'misc_lecture.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: const BoxDecoration(color: Color(0xFF2D2C2C)),
        child: Scrollbar(
          thickness: 8,
          radius: const Radius.circular(6),
          thumbVisibility: true,
          trackVisibility: true,
          child: ListView(
            padding: EdgeInsets.only(top: 8.h, left: 30.w),
            children: [
              const IntroCard(),
              Divider(
                thickness: 0.5,
                color: Colors.grey,
                endIndent: 30.w,
              ),
              const DavidMalanCard(),
              Divider(
                thickness: 0.5,
                color: Colors.grey,
                endIndent: 30.w,
              ),
              for (int i = 0; i < 11; i++ ) WeekLecture(i),
              Divider(
                thickness: 0.5,
                color: Colors.grey,
                endIndent: 30.w,
              ),
              const MiscLecture(0, "Tech interviews"),
              const MiscLecture(1, "Movie Night 2022"),
              const MiscLecture(2, "Cyber Security"),
              Divider(
                thickness: 0.5,
                color: Colors.grey,
                endIndent: 30.w,
              ),
              const About(),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }
}
