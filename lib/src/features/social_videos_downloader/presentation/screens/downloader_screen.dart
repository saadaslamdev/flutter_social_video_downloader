import 'package:flutter/material.dart';
import 'package:flutter_social_videos_downloader/src/core/media_query.dart';
import 'package:flutter_social_videos_downloader/src/core/utils/app_colors.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/presentation/widgets/downloader_Screen/Downloader_screen_appbar.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/presentation/widgets/downloader_Screen/downloader_screen_bottom_app_bar.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/presentation/widgets/downloader_Screen/downloader_screen_body.dart';

import '../../../../config/routes_manager.dart';
import '../../../../core/common_widgets/app_background.dart';

class DownloaderScreen extends StatefulWidget {
  const DownloaderScreen({super.key});

  @override
  State<DownloaderScreen> createState() => _DownloaderScreenState();
}

class _DownloaderScreenState extends State<DownloaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: context.width,
          height: context.height / 2.2,
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        ),
        SafeArea(
          child: Stack(
            children: [
              const AppBackground(
                heightRatio: 1.5,
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    const AppBarWithLogo(),
                    SizedBox(
                      height: context.height * 0.03,
                    ),
                    const DownloaderScreenBody(),
                  ],
                ),
              )
            ],
          ),
        ),
        DownloaderBottomAppBar(onDownloadPressed: () {
          Navigator.of(context).pushNamed(Routes.downloads);
        })
      ],
    ));
  }
}
