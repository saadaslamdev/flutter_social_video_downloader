import 'package:flutter/material.dart';
import 'package:flutter_social_videos_downloader/src/core/media_query.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/common_widgets/container_with_shadows.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styles_manager.dart';

class DownloaderScreenSupportedPlatforms extends StatefulWidget {
  const DownloaderScreenSupportedPlatforms({super.key});

  @override
  State<DownloaderScreenSupportedPlatforms> createState() =>
      _DownloaderScreenSupportedPlatformsState();
}

class _DownloaderScreenSupportedPlatformsState
    extends State<DownloaderScreenSupportedPlatforms> {
  @override
  Widget build(BuildContext context) {
    return ContainerWithShadows(
      widthMultiplier: 0.9,
      heightMultiplier: 0.3,
      applyGradient: false,
      child: Padding(
        padding: EdgeInsets.all(context.height * 0.02),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                'Supported Platforms:',
                textAlign: TextAlign.center,
                style: getTitleStyle(
                  fontSize: context.width * 0.05,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: SvgPicture.asset(
                            AppAssets.facebook,
                            fit: BoxFit.contain,
                            width: context.width * 0.22,
                          ),
                        ),
                        Flexible(
                          child: SvgPicture.asset(
                            AppAssets.instagram,
                            fit: BoxFit.contain,
                            width: context.width * 0.22,
                          ),
                        ),
                        Flexible(
                          child: SvgPicture.asset(
                            AppAssets.tiktok,
                            fit: BoxFit.contain,
                            width: context.width * 0.22,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: SvgPicture.asset(
                            AppAssets.youtube,
                            fit: BoxFit.contain,
                            width: context.width * 0.22,
                          ),
                        ),
                        Flexible(
                          child: SvgPicture.asset(
                            AppAssets.shorts,
                            fit: BoxFit.contain,
                            width: context.width * 0.22,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
