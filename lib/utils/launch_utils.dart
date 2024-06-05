import 'package:url_launcher/url_launcher.dart';

/// открываем любую ссылку вне приложения
Future<void> launchLinks(
  String url, {
  bool isOpenOnApp = false,
}) async {
  final link = Uri.parse(url);
  if (await canLaunchUrl(link)) {
    await launchUrl(
      link,
      mode: isOpenOnApp
          ? LaunchMode.externalApplication
          : LaunchMode.platformDefault,
    );
  }
}
