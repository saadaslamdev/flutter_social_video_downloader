import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_videos_downloader/src/core/common_widgets/circular_loader_with_overlay.dart';
import '../../../../config/routes_manager.dart';
import '../bloc/downloader_bloc.dart';
import '../widgets/downloader_Screen/downloader_screen_body.dart';
import '../widgets/downloader_Screen/downloader_screen_bottom_app_bar.dart';

class DownloaderScreen extends StatefulWidget {
  const DownloaderScreen({super.key});

  @override
  State<DownloaderScreen> createState() => _DownloaderScreenState();
}

class _DownloaderScreenState extends State<DownloaderScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DownloaderBloc, DownloaderState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              body: const DownloaderScreenBody(),
              bottomNavigationBar:
                  DownloaderBottomAppBar(onDownloadPressed: () {
                Navigator.of(context).pushNamed(Routes.downloads);
              }),
            ),
            if (state is DownloaderGetVideoLoading)
              const CircularLoaderWithOverlay(),
          ],
        );
      },
    );
  }
}
