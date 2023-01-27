import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// clickable icon that launches url in app's web browser.
class UrlIcon extends StatelessWidget {
  final String assetIcon;
  final Color iconColor;
  final double iconScale;
  final String host;
  final String path;

  const UrlIcon(this.assetIcon, this.iconColor, this.host, this.path,
      {Key? key, this.iconScale = 3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        child: Image.asset(
          assetIcon,
          scale: iconScale,
          color: iconColor,
        ),
        onTap: () {
          launchUrl(
              Uri(
                scheme: 'https',
                host: host,
                path: path,
              ),
              mode: LaunchMode.externalApplication);
        },
      ),
    );
  }
}
