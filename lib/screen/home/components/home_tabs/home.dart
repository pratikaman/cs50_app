import 'package:final_project/configs/globals.dart';
import 'package:final_project/configs/palette.dart';
import 'package:final_project/configs/strings.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// controller for youtube player.
    YoutubePlayerController controller = YoutubePlayerController(
      /// initial video is set to course intro video.
      initialVideoId: miscLectureVideoId[3],
      flags: const YoutubePlayerFlags(
        hideControls: false,
        autoPlay: false,
        mute: false,
        enableCaption: false
      ),
    );

    return Scrollbar(
      thickness: 4,
      radius: const Radius.circular(6),
      thumbVisibility: true,
      trackVisibility: true,

      ///
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          /// heading.
          const Text(
            homeTabWelcomeHeading,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),

          /// divider line.
          const Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),

          /// course introduction text.
          const Text(
            homeTabCourseIntro,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),

          /// course page.
          RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 16),
              children: <TextSpan>[
                TextSpan(text: 'Course link- ',),
                TextSpan(text: 'https://cs50.harvard.edu/x/2022/' ,style: TextStyle(color: primaryColor)),
              ],
            ),
          ),

          /// edx page of course.
          RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 16),
              children: <TextSpan>[
                TextSpan(text: 'Edx link- ',),
                TextSpan(text: 'https://cs50.edx.org/' ,style: TextStyle(color: primaryColor)),
              ],
            ),
          ),

          /// divider.
          const Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),

          /// intro video heading.
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "Watch an introduction 🎥",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),

          /// intro video
          YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: primaryColor,
            progressColors: const ProgressBarColors(
              playedColor: primaryColor,
              handleColor: primaryColor,
              backgroundColor: secondaryColor,
              bufferedColor: Colors.transparent,
            ),
            onReady: () {
              controller.addListener(() {});
            },
          ),
        ],
      ),
    );
  }
}
