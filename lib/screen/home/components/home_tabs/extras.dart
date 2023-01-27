import 'package:final_project/configs/globals.dart';
import 'package:final_project/configs/palette.dart';
import 'package:final_project/screen/web_view.dart';
import 'package:final_project/utils/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class Extras extends ConsumerWidget {
  const Extras({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    /// scroll bar for list view used here.
    return Scrollbar(
      thickness: 4,
      radius: const Radius.circular(6),
      thumbVisibility: true,
      trackVisibility: true,

      /// list view containing list of widgets.
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          /// community heading.
          const Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              "Communities 📱🌈",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),

          /// wrapping GridView in container to give
          /// fixed height and padding.
          Container(
            height: 520.h,
            padding: const EdgeInsets.only(top: 8),

            /// grid of social media link buttons.
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),

              /// number of column.
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 12,

              /// button size ratio- width to height
              childAspectRatio: 2,
              children: [
                for (int i = 0; i < 20; i++)

                  /// elevated button.
                  /// it is tappable, on tappping it opens social media link
                  /// in app's browser.
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        rainbowColor(i, 0.6),
                      ),
                    ),
                    onPressed: () {
                      launchUrl(
                        Uri.parse(cs50communities[i][1]),
                        mode: LaunchMode.externalApplication,
                      );
                    },
                    child: Text(
                      cs50communities[i][0],
                      style: const TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),

          const Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),

          /// final projects button.
          Container(
            padding: const EdgeInsets.only(right: 60),
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 60.h,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  primaryColor.withOpacity(0.9),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  createRoute(
                    const WebPage(finalProjectsUrl),
                  ),
                );
              },
              child: const Text(
                'Final Projects 🛠️',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          ///
          const Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),

          ///
          const Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              "Miscellaneous 🤖",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),

          /// links for academic honesty, faqs,
          /// grade book, staff page, syllabus.
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: const Text(
                "• Academic honesty",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: primaryColor,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  createRoute(
                    const WebPage(academicHonestyUrl),
                  ),
                );
              },
            ),
          ),

          ///
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: const Text(
                "• FAQs",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: primaryColor,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  createRoute(
                    const WebPage(faqsUrl),
                  ),
                );
              },
            ),
          ),

          ///
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: const Text(
                "• Grade book",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: primaryColor,
                ),
              ),
              onTap: () {
                launchUrl(
                  Uri.parse(gradeBookUrl),
                  mode: LaunchMode.externalApplication,
                );
              },
            ),
          ),

          ///
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: const Text(
                "• Staff",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: primaryColor,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  createRoute(
                    const WebPage(staffInfoUrl),
                  ),
                );
              },
            ),
          ),

          ///
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: const Text(
                "• Syllabus",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: primaryColor,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  createRoute(
                    const WebPage(syllabusUrl),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// returns color for a given number.
  /// this is being used to create rainbow pattern
  /// for grid of course's social media buttons.
  Color rainbowColor(int index, [double opacity = 1.0]) {
    if (index < 3) {
      return const Color(0xffFF0000).withOpacity(opacity);
    } else if (index > 2 && index < 6) {
      return const Color(0xffFF7F00).withOpacity(opacity);
    } else if (index > 5 && index < 9) {
      return const Color(0xffFFFF00).withOpacity(opacity);
    } else if (index > 8 && index < 12) {
      return const Color(0xff00FF00).withOpacity(opacity);
    } else if (index > 11 && index < 15) {
      return const Color(0xff0000FF).withOpacity(opacity);
    } else if (index > 14 && index < 18) {
      return const Color(0xff4B0082).withOpacity(opacity);
    } else {
      return const Color(0xff9400D3);
    }
  }
}
