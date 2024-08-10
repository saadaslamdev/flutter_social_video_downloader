import 'package:flutter/material.dart';
import 'package:flutter_social_videos_downloader/src/core/media_query.dart';
import 'package:flutter_social_videos_downloader/src/core/common_widgets/container_with_shadows.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/styles_manager.dart';

class AppBarWithLogo extends StatelessWidget {
  const AppBarWithLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ContainerWithShadows(
          widthMultiplier: 0.9,
          heightMultiplier: 0.2,
          applyGradient: false,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  width: context.width * 0.3,
                  height: context.height * 0.08,
                  fit: BoxFit.scaleDown,
                  image: const AssetImage(AppAssets.logo),
                ),
                Text(
                  AppStrings.appName.toUpperCase(),
                  style: getTitleStyle(
                      fontSize: context.width * 0.06,
                      color: AppColors.primaryColor),
                ),
                Text(AppStrings.appSlogan,
                    style: getRegularStyle(
                        fontSize: context.width * 0.04,
                        color: AppColors.primaryColor))
              ],
            ),
          )),
    );
  }
}
