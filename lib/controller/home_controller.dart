import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// change notifier provider for home tab.
final homeProvider = ChangeNotifierProvider<_homeNotifier>((ref) {
  return _homeNotifier();
});

/// change notifier for home tab
/// it is used for state management.
class _homeNotifier extends ChangeNotifier {
  _homeNotifier();

  /// current selected tab
  int selectedTab = 1;

  /// pageview widget is being used for tabs
  /// this page controller is used for controlling the pagview
  late PageController pageController;

  /// upadate the current selected tab.
  void updateSelectedIndex(int index){
    selectedTab = index;

    /// notify the listeners of this provider.
    notifyListeners();
  }

  /// set page the page controller.
  void setPageController(PageController controller){
   pageController = controller;
  }

}
