import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('error');
    }
  }

  static Future<void> openEmail({String toEmail, String subject, String body}) async {
    final url =
        'mailto:${Uri.encodeFull(toEmail)}?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}';
    await _launchURL(url);
  }
}
