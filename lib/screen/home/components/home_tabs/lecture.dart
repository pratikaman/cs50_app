import 'package:final_project/configs/globals.dart';
import 'package:final_project/configs/palette.dart';
import 'package:final_project/controller/lecture_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// code used here is from this package.
/// https://inappwebview.dev/docs/5.x.x/webview/in-app-webview

class Lecture extends ConsumerStatefulWidget {
  const Lecture({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LectureState();
}

class _LectureState extends ConsumerState<Lecture>
    with AutomaticKeepAliveClientMixin {

  late YoutubePlayerController controller;

  @override
  void initState() {

    /// controller for youtube player.
    controller = YoutubePlayerController(
      initialVideoId: miscLectureVideoId[3],
      flags: const YoutubePlayerFlags(
        hideControls: false,
        autoPlay: false,
        mute: false,
        enableCaption: false,
      ),
    );

    /// set the youtube player to lecture provider.
    ref.read(lectureProvider).setYoutubePlayerController(controller);

    super.initState();
  }

  /// keep this tab in memory even if its not the tab being displayed.
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    /// column of widgets.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// lecture title.
         Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            ref.watch(lectureProvider).lecture,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),

        /// youtube player for viewing lecture.
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
    );
  }
}
