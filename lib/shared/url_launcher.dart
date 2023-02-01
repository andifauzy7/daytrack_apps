import 'package:url_launcher/url_launcher.dart';

Future<void> urlLauncher(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.inAppWebView,
  )) {
    throw Exception('Could not launch $url');
  }
}
