import 'package:flutter/material.dart';
import 'package:flutter_social_videos_downloader/src/config/routes_manager.dart';

import 'config/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Videos Downloader',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      onGenerateRoute: AppRounter.getRoute,
      theme: getAppTheme(),
    );
  }
}
