import 'package:final_project/screen/home/components/home_tabs/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_tabs/extras.dart';
import 'home_tabs/lecture.dart';
import 'home_tabs/notes.dart';

/// lis of tab screens.
List<Consumer> tabsList = [

  /// home tab screen.
  Consumer(
    builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return const HomeTab();
    },
  ),

  /// lecture tab screen.
  Consumer(
    builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return const Lecture();
    },
  ),

  /// extras tab screen.
  Consumer(
    builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return const Extras();
    },
  ),

  /// notes tab screen.
  Consumer(
    builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return const NotesTab();
    },
  ),
];
