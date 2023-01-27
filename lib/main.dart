import 'package:final_project/screen/home/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'configs/globals.dart';
import 'configs/palette.dart';

void main() {
  runApp(
    /// this ProviderScope enables to use Riverpod state management
    /// https://riverpod.dev/docs/getting_started
    /// For widgets to be able to read providers, we need to wrap the entire
    /// application in a "ProviderScope" widget.
    /// This is where the state of our providers will be stored.
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      /// this is the screen resolution of emulator which
      /// I used for testing the app while developing it.
      /// I used pixel 5 emulator.
      designSize: const Size(393, 851),
      builder: (context, child) {
        return MaterialApp(
          /// title of app.
          title: 'CS50',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            /// This is the theme of app.
            primarySwatch: Colors.red,
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: Colors.black,
                  fontFamily: GoogleFonts.openSans().fontFamily,
                ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: primaryColor,
            ),
              scrollbarTheme: const ScrollbarThemeData().copyWith(
                thumbColor: MaterialStateProperty.all(primaryColor.withOpacity(0.4)),
              )
          ),
          home:  const MyHomePage(title: 'CS50x ($courseYear)'),
        );
      },
    );
  }
}
