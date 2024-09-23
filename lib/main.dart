  import 'package:device_preview/device_preview.dart';
  import 'package:flutter/foundation.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:flutter_social_videos_downloader/bloc_observer.dart';

  import 'src/container_injector.dart';
  import 'src/my_app.dart';

  void main() {
    WidgetsFlutterBinding.ensureInitialized();
    initApp();
    Bloc.observer = MyBlockObserver();
    runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ));
  }
