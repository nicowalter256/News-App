import 'package:url_launcher/url_launcher.dart';

class LaunchUrl {
  LaunchUrl._();

  static Future<void> openUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not open the map.';
    }
  }
}
