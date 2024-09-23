import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_videos_downloader/src/config/routes_manager.dart';
import 'package:flutter_social_videos_downloader/src/container_injector.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/presentation/bloc/downloader_bloc/downloader_bloc.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/presentation/bloc/theme_bloc/theme_bloc.dart';

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
          BlocProvider(
            create: (context) => ThemeBloc(),
          ),
        ],
        child: AdaptiveTheme(
          light: ThemeState.lightTheme.themeData,
          dark: ThemeState.darkTheme.themeData,
          debugShowFloatingThemeButton: false,
          initial: AdaptiveThemeMode.light,
          builder: (theme, darkTheme) => BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                themeAnimationCurve: Curves.fastOutSlowIn,
                debugShowCheckedModeBanner: false,
                title: 'Social Saver',
                theme: state.themeData,
                darkTheme: state.themeData,
                initialRoute: Routes.splash,
                onGenerateRoute: AppRounter.getRoute,
              );
            },
          ),
        ));
  }
}
