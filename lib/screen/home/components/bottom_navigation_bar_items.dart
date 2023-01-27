import 'package:flutter/material.dart';

/// list of icons to display in bottom navigation bar.
List<BottomNavigationBarItem> bottomTabs = [

  /// home tab icon.
  const BottomNavigationBarItem(
      icon: Icon(
          Icons.home_filled
      ),
      activeIcon: Icon(
          Icons.home_filled
      ),
      label: 'Home'),

  /// lecture tab icon.
  const BottomNavigationBarItem(
      icon: Icon(
          Icons.laptop
      ),
      activeIcon: Icon(
          Icons.laptop
      ),
      label: 'Lecture'),

  /// extras tab icon.
  const BottomNavigationBarItem(
      icon: Icon(
          Icons.celebration
      ),
      activeIcon: Icon(
          Icons.celebration
      ),
      label: 'Extras'),

  /// notes tab icon.
  const BottomNavigationBarItem(
      icon: Icon(
          Icons.note_alt_rounded
      ),
      activeIcon: Icon(
          Icons.note_alt_rounded
      ),
      label: 'Notes'),
];