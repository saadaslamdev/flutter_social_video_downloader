import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../features/social_videos_downloader/presentation/screens/downloader_screen.dart';
import '../features/social_videos_downloader/presentation/screens/downloads_screen.dart';
import '../features/social_videos_downloader/presentation/widgets/downloads_screen/view_video_screen.dart';
import '../features/splash/splash_screen.dart';

class Routes {
  static const String splash = "/splash";
  static const String downloader = "/downloader";
  static const String downloads = "/downloads";
  static const String viewVideo = "/viewVideo";
}

class AppRounter {
  static Route? getRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.downloader:
        return MaterialPageRoute(
            builder: (context) => const DownloaderScreen());
      case Routes.downloads:
        return MaterialPageRoute(builder: (context) => const DownloadsScreen());
      case Routes.viewVideo:
        return MaterialPageRoute(
            builder: (context) => ViewVideoScreen(
                  videoPath: setting.arguments as String,
                ));
    }
    return null;
  }
}
