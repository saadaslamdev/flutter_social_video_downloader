import 'package:flutter/material.dart';
import 'package:flutter_social_videos_downloader/src/core/media_query.dart';
import 'package:flutter_social_videos_downloader/src/core/common_widgets/circular_elevated_button.dart';

import '../../../../../core/utils/app_colors.dart';
import 'animated_toggle_button.dart';

class DownloaderBottomAppBar extends StatelessWidget {
  final VoidCallback? onSharePressed;
  final VoidCallback? onDownloadPressed;
  const DownloaderBottomAppBar(
      {super.key, this.onSharePressed, this.onDownloadPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          width: context.width / 1.1,
          height: context.height / 11,
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularElevatedButton(
                  onPressed: () {},
                  backgroundColor: AppColors.white,
                  child: const Icon(
                    Icons.share,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: AnimatedToggleButton(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularElevatedButton(
                  onPressed: () {
                    onDownloadPressed?.call();
                  },
                  backgroundColor: AppColors.white,
                  child: const Icon(
                    Icons.download,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}