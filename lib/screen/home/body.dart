import 'package:final_project/configs/palette.dart';
import 'package:final_project/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/bottom_navigation_bar_items.dart';
import 'components/drawer/drawer.dart';
import 'components/home_tab_list.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  ConsumerState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  late PageController _pageController;

  @override
  void initState() {
    /// initialize the page controller.
    _pageController = PageController(
      initialPage: 1,
    );

    /// set the initialized page controller home tab provider.
    ref.read(homeProvider).setPageController(_pageController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      /// slidable app drawer.
      drawer: const SafeArea(child: AppDrawer()),

      /// app bar.
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(widget.title),
      ),

      /// the main body.
      /// it is page view.
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: tabsList,
      ),

      /// bottom navigation bar.
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
        currentIndex: ref.watch(homeProvider).selectedTab,

        /// instructions to execute on tapping the tab icons.
        onTap: (currentIndex) {
          /// update the selectedTab in home provider to current tapped icons index.
          ref.read(homeProvider).updateSelectedIndex(currentIndex);

          /// programmatically scroll to tapped tab.
          _pageController.animateToPage(
            ref.watch(homeProvider).selectedTab,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },

        /// list of tab icons.
        items: bottomTabs,
      ),
    );
  }
}
