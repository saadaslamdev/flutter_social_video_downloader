import 'package:flutter/material.dart';
import 'package:flutter_social_videos_downloader/src/core/media_query.dart';
import 'package:flutter_social_videos_downloader/src/features/dashboard/widgets/container_with_shadows.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styles_manager.dart';

class DownloaderScreenAppBar extends StatelessWidget {
  final String icon;
  const DownloaderScreenAppBar({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ContainerWithShadows(
          widthMultiplier: 0.9,
          heightMultiplier: 0.15,
          applyGradient: false,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.getIconbyName(icon),
                  width: context.width * 0.4,
                  height: context.height * 0.09,
                  fit: BoxFit.scaleDown,
                ),
                Text(
                  icon.toUpperCase(),
                  style: getTitleStyle(
                      fontSize: context.height * 0.025,
                      color: AppColors.primaryColor),
                ),
              ],
            ),
          )),
    );
  }
}
