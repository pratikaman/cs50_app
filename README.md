# CS50 Unofficial app📱

#### Video Demo:  <URL HERE>

#### Description:

My final project is an unofficial android app for CS50 made using [flutter](https://flutter.dev/) 🐥.  
Its an basic implementation of course website in form of an app.
The app allows to watch lectures, make/edit notes, view other course related stuff.
This is app is made for the 2022 version of course.
I'll try to update and improve it with 2023 version when it comes.
The design idea and contents of app are taken from course [webpage](https://cs50.harvard.edu/x/2022/).

There are mainly four screens in the app in form of tabs and one slidable drawer.
Tabs are - **Home**, **Lecture**, **Extras**, **Notes**.
Home tab contains introduction about the app and the intro video of course.
Lecture tab is for viewing lectures of course.
Extras contain some links related to course.
Notes tab is for making/editing notes in app.

The **slidable drawer** contains Prof David J. Malan's social media handles' information,
week lectures list (tapping on them play them in lecture tab),
miscellaneous lectures held for 2022, and about section of the app.

To build apk of app run the below commands from command-line in project directory. Make sure you have flutter installed in you pc.
```
flutter pub get
flutter build apk
```

#### Project Structure:

Following table contains the brief project structure.

| Directory/ *files* | Description                                                                                           |
|--------------------|-------------------------------------------------------------------------------------------------------|
| android            | android specific file [auto generated].                                                               |
| assets             | contains all media files used in project. Like image files.                                           |
| lib                | this contains all the code, where all the interesting stuff is. 🪄                                    |
| *pubspec.yaml*     | contains metadata about the project that the Dart and Flutter tooling needs to know. [auto generated] |
| *README.md*        | this file that you are reading currently.                                                             |

***

-- **assets** directory contains two sub directories named-
1. images -> contains all the images used in the app.
2. lottie -> contains all the lottie used in the app.

***

-- **lib** directory contains following sub directories and *files* named-

| Directory/ *files* | Description                                                                                                         |
|--------------------|---------------------------------------------------------------------------------------------------------------------|
| configs            | this contains course specific colors, strings etc files.                                                            |
| controller         | all state management files for the screens.                                                                         |
| screen             | this contains all the screens' UI code.                                                                             |
| utils              | common functions used in the screens.                                                                               |
| z                  | contains files/directories I made but later decided to not use them in current version but may be of use in future. |
| *main.dart*        | main entry point everytime the app the starts.                                                                      |

-- Detailed structure of **lib** directory

1. screen
   - home -> contains code of tabs.
      - components
         - drawer -> code for slidable drawer
            - *about.dart*
            - *david_malan_card.dart*
            - *drawer.dart* -> code for body of drawer. it contains intro, lecture list, miscellaneous lecture list, prof's social media info, about section.
            - *intro_card.dart*
            - *lecture.dart*
            - *misc_lecture.dart*
         - home_tabs
            - *extras.dart* -> code for extras tab.
            - *home.dart* -> code for home tab
            - *lecture.dart* -> code for lecture tab.
            - *notes.dart* -> code for notes tab.
         - *bottom_navigation_bar_items.dart* -> bottom navigation bar items.
         - *home_tab_list.dart*
      - *body.dart* -> code for body of home screen.
   - *add_note.dart* -> contains code of screen for writing new note.
   - *web_view.dart* -> contains code for screen for viewing any external URLs.

2. utils
   - *page_transition.dart* -> util functions for defining how a new screen should load. for now there is only one slide animation. in future version will add more as required.
   - *remove_side_bar.dart* -> this contains the java script to remove the side bar of course page when opening in webview. it is injected at the time of page loading.
   - *sqflite_db.dart* -> configurations for local database created by app for storing notes data.
   - *url_icon.dart* ->

3. controller (these are state providers. I'm using flutter [riverpod](https://riverpod.dev/docs/getting_started) for state management)
   - *home_controller.dart* -> state provider for home tab.
   - *lecture_controller.dart* -> state provider for lecture tab.
   - *notes_controller.dart* -> state provider for notes tab.

4. configs
   - *globals.dart* -> course year specific configurations. currently contains for year 2022.
   - *palette.dart* -> colors used in app.
   - *strings.dart* -> strings used in app.

*More elaborate explanation of each file can be found the in comments in each file.*
***

List of external packages used in this project-

1. [flutter_screenutil](https://pub.dev/packages/flutter_screenutil)
2. [flutter_riverpod](https://pub.dev/packages/flutter_riverpod)
3. [flutter_inappwebview](https://pub.dev/packages/flutter_inappwebview)
4. [google_fonts](https://pub.dev/packages/google_fonts)
5. [sqflite](https://pub.dev/packages/sqflite)
6. [path_provider](https://pub.dev/packages/path_provider)
7. [path](https://pub.dev/packages/path)
8. [url_launcher](https://pub.dev/packages/url_launcher)
9. [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)
10. [lottie](https://pub.dev/packages/lottie)
11. [youtube_player_flutter](https://pub.dev/packages/youtube_player_flutter)
***

Credits-
1. [loading lottie](https://lottiefiles.com/116545-loading-cat)
2. [cs50 cat logo](https://cdn.cs50.net/2021/fall/lectures/8/src8/cat.gif)
***