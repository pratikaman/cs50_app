import 'package:final_project/configs/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// change notifier provider for lecture tab.
final lectureProvider = ChangeNotifierProvider<_lectureNotifier>((ref) {
  return _lectureNotifier();
});

/// change notifier for lecture tab.
/// it is used for state management.
class _lectureNotifier extends ChangeNotifier {
  _lectureNotifier();

  /// controller for YotubePlayer widget.
  late YoutubePlayerController controller;

  /// the title of current playing widget.
  /// we initialise it to the title of introduction video.
  /// it is updated according to the lecture being played.
  String lecture = "Introduction Video";

  /// set the youtube controller.
  void setYoutubePlayerController(YoutubePlayerController controller){
    this.controller = controller;

    /// notify the listeners of this provider
    notifyListeners();
  }

  /// set the lecture title and
  /// play the lecture.
  void viewLecture (int weekIndex) {
    /// set the title
    /// example - "Lecture 0 - Scratch"
    lecture = "Lecture $weekIndex - ${weekLectureTopic[weekIndex]}";
    /// play the lecture
    controller.load(weekLectureVideoId[weekIndex]);
    /// notify the listener of this provider
    notifyListeners();
  }

  /// set the miscellaneous lecture title and
  /// play the lecture
  void viewMiscLecture (String lectureName, int miscLectureIndex) {
    /// set the title
    lecture = lectureName;
    /// play the lecture.
    controller.load(miscLectureVideoId[miscLectureIndex]);
    /// notify the listeners of this provider.
    notifyListeners();
  }

}