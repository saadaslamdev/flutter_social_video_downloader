import 'package:flutter/material.dart';
import 'package:flutter_social_videos_downloader/src/core/media_query.dart';

import '../utils/app_colors.dart';

class AppBackground extends StatelessWidget {
  final double heightRatio;
  const AppBackground({super.key, required this.heightRatio});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height / heightRatio,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
    );
  }
}
