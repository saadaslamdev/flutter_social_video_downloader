import 'package:flutter/material.dart';
import 'package:flutter_social_videos_downloader/src/core/media_query.dart';
import 'package:flutter_social_videos_downloader/src/core/utils/app_colors.dart';
import 'package:flutter_social_videos_downloader/src/core/utils/styles_manager.dart';
import 'package:flutter_social_videos_downloader/src/features/dashboard/widgets/dashboard_screen_appbar.dart';
import 'package:flutter_social_videos_downloader/src/features/dashboard/widgets/dashboard_screen_bottom_app_bar.dart';
import 'package:flutter_social_videos_downloader/src/features/dashboard/widgets/circular_elevated_button.dart';
import 'package:flutter_social_videos_downloader/src/core/common_widgets/container_with_shadows.dart';
import 'package:flutter_social_videos_downloader/src/features/dashboard/widgets/dashboard_screen_body.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/routes_manager.dart';
import '../../core/common_widgets/app_background.dart';
import '../../core/utils/app_assets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    const AppBarWithLogo(),
                    SizedBox(
                      height: context.height * 0.07,
                    ),
                    const DashboardScreenBody(),
                  ],
                ),
              )
            ],
          ),
        ),
        CustomBottomAppBar(onDownloadPressed: () {})
      ],
    ));
  }
}
