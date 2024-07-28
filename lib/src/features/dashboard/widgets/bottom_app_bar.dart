import 'package:flutter/material.dart';
import 'package:flutter_social_videos_downloader/src/core/media_query.dart';
import 'package:flutter_social_videos_downloader/src/features/dashboard/widgets/circular_elevated_button.dart';

import '../../../core/utils/app_colors.dart';

class CustomBottomAppBar extends StatelessWidget {
  final VoidCallback? onMenuPressed;
  final VoidCallback? onDownloadPressed;
  const CustomBottomAppBar(
      {super.key, this.onMenuPressed, this.onDownloadPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: context.width / 1.1,
        height: context.height / 12,
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularElevatedButton(
                onPressed: () {
                  onMenuPressed?.call();
                },
                backgroundColor: AppColors.white,
                child: const Icon(
                  Icons.menu,
                  color: AppColors.primaryColor,
                ),
              ),
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
    );
  }
}