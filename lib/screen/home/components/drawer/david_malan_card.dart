import 'package:final_project/configs/globals.dart';
import 'package:final_project/configs/palette.dart';
import 'package:final_project/configs/strings.dart';
import 'package:final_project/utils/url_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/// prof's social media accounts info.
/// used is drawer.dart
class DavidMalanCard extends StatelessWidget {
  const DavidMalanCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        /// prof David J Malan.
        Container(
          margin: EdgeInsets.only(top: 10.h),
          child: Text(
            profDavidMalan,
            style: TextStyle(
                color: whiteColor ,
                fontWeight: FontWeight.w600,
                fontSize: 22.sp),
          ),
        ),

        /// profs' official email as mentioned on cs50 course site.
        Text(
          profDavidMalanMail,
          style: TextStyle(
              color: whiteColor ,
              fontWeight: FontWeight.w400,
              fontSize: 20.sp),
        ),

        ///
        Container(
          margin: EdgeInsets.only(top: 4.h),
          child: Row(
            children: const [
              UrlIcon(
                "assets/images/fb.png",
                whiteColor,
                "facebook.com",
                profDavidMalanFaceBook,
                iconScale: 4,
              ),
              UrlIcon(
                "assets/images/github.png",
                whiteColor,
                "github.com",
                profDavidMalanGitHub,
                iconScale: 4,
              ),
              UrlIcon(
                "assets/images/instagram.png",
                whiteColor,
                "instagram.com",
                profDavidMalanInstagram,
                iconScale: 4,
              ),
              UrlIcon(
                "assets/images/linkedin.png",
                whiteColor,
                "linkedin.com",
                profDavidMalanLinkedIn,
                // iconScale: 3,
              ),
              UrlIcon(
                "assets/images/quora.png",
                whiteColor,
                "quora.com",
                profDavidMalanQuora,
                iconScale: 4,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 4.h),
          child: Row(
            children: const [
              UrlIcon(
                "assets/images/reddit.png",
                whiteColor,
                "reddit.com",
                profDavidMalanReddit,
                iconScale: 4,
              ),
              UrlIcon(
                "assets/images/tiktok.png",
                whiteColor,
                "tiktok.com",
                profDavidMalanTikTok,
                iconScale: 4,
              ),
              UrlIcon(
                "assets/images/twitter.png",
                whiteColor,
                "twitter.com",
                profDavidMalanTwitter,
                iconScale: 4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}