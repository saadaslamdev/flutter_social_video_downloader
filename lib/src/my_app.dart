import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_videos_downloader/src/config/routes_manager.dart';
import 'package:flutter_social_videos_downloader/src/container_injector.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/presentation/bloc/downloader_bloc.dart';

import 'config/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DownloaderBloc>(
          create: (context) => sl<DownloaderBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Social Saver',
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splash,
        onGenerateRoute: AppRounter.getRoute,
        theme: getAppTheme(),
      ),
    );
  }
}
