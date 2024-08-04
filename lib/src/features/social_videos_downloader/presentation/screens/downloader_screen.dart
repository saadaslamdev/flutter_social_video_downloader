import 'package:flutter/material.dart';
import 'package:flutter_social_videos_downloader/src/core/media_query.dart';
import 'package:flutter_social_videos_downloader/src/core/utils/app_colors.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/presentation/widgets/downloader_Screen/downloader_screen_app_bar.dart';

import '../../../../core/common_widgets/app_background.dart';
import '../widgets/downloader_Screen/downloader_screen_body.dart';

class DownloaderScreen extends StatefulWidget {
  final String platformIcon;
  const DownloaderScreen({super.key, required this.platformIcon});

  @override
  State<DownloaderScreen> createState() => _DownloaderScreenState();
}

class _DownloaderScreenState extends State<DownloaderScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController videoLinkController = TextEditingController();
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
                heightRatio: 2.2,
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DownloaderScreenAppBar(icon: widget.platformIcon),
                    SizedBox(
                      height: context.height * 0.04,
                    ),
                    const DownloaderScreenBody(),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
