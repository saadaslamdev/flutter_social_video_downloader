import 'package:flutter/material.dart';
import 'package:flutter_social_videos_downloader/src/core/media_query.dart';
import 'package:flutter_social_videos_downloader/src/core/utils/app_colors.dart';
import 'package:flutter_social_videos_downloader/src/core/utils/styles_manager.dart';
import 'package:flutter_social_videos_downloader/src/features/dashboard/widgets/appbar_with_logo.dart';
import 'package:flutter_social_videos_downloader/src/features/dashboard/widgets/bottom_app_bar.dart';
import 'package:flutter_social_videos_downloader/src/features/dashboard/widgets/circular_elevated_button.dart';
import 'package:flutter_social_videos_downloader/src/features/dashboard/widgets/container_with_shadows.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/routes_manager.dart';
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
                    Center(
                        child: ContainerWithShadows(
                      widthMultiplier: 0.9,
                      heightMultiplier: 0.5,
                      applyGradient: false,
                      child: Padding(
                        padding: EdgeInsets.all(context.height * 0.02),
                        child: Column(
                          children: [
                            Expanded(
                                child: Text('Select a Platform:',
                                    textAlign: TextAlign.center,
                                    style: getTitleStyle(
                                        fontSize: context.width * 0.05,
                                        color: AppColors.primaryColor))),
                            Expanded(
                                flex: 7,
                                child: Column(children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CircularElevatedButton(
                                          child: SvgPicture.asset(
                                            AppAssets.facebook,
                                            fit: BoxFit.cover,
                                          ),
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, Routes.downloader,
                                                arguments: 'facebook');
                                          },
                                        ),
                                        CircularElevatedButton(
                                          child: SvgPicture.asset(
                                            AppAssets.instagram,
                                            fit: BoxFit.cover,
                                          ),
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, Routes.downloader,
                                                arguments: 'instagram');
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: context.height * 0.02),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CircularElevatedButton(
                                          child: SvgPicture.asset(
                                            AppAssets.tiktok,
                                            fit: BoxFit.cover,
                                          ),
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, Routes.downloader,
                                                arguments: 'tiktok');
                                          },
                                        ),
                                        CircularElevatedButton(
                                          child: SvgPicture.asset(
                                            AppAssets.youtube,
                                            fit: BoxFit.cover,
                                          ),
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, Routes.downloader,
                                                arguments: 'youtube');
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: context.height * 0.02),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(width: context.width * 0.25),
                                        CircularElevatedButton(
                                          child: SvgPicture.asset(
                                            AppAssets.shorts,
                                            fit: BoxFit.cover,
                                          ),
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, Routes.downloader,
                                                arguments: 'shorts');
                                          },
                                        ),
                                        SizedBox(width: context.width * 0.25),
                                      ],
                                    ),
                                  ),
                                ]))
                          ],
                        ),
                      ),
                    )),
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
