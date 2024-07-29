import 'package:flutter/material.dart';
import 'package:flutter_social_videos_downloader/src/core/media_query.dart';
import 'package:flutter_social_videos_downloader/src/core/utils/app_colors.dart';
import 'package:flutter_social_videos_downloader/src/core/utils/app_strings.dart';
import 'package:flutter_social_videos_downloader/src/features/dashboard/widgets/bottom_app_bar.dart';
import 'package:flutter_social_videos_downloader/src/features/dashboard/widgets/container_with_shadows.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/presentation/widgets/downloader_Screen/downloader_screen_app_bar.dart';

import '../../../../core/custom_widgets/custom_elevated_button.dart';
import '../widgets/downloader_Screen/downloader_screen_input_field.dart';

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: context.width * 0.05),
                          child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: AppColors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: context.width * 0.05),
                          child: IconButton(
                              icon: const Icon(Icons.info_rounded,
                                  color: AppColors.white),
                              onPressed: () {
                                //Navigator.pop(context);
                              }),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.height * 0.03,
                    ),
                    DownloaderScreenAppBar(icon: widget.platformIcon),
                    SizedBox(
                      height: context.height * 0.04,
                    ),
                    Center(
                        child: ContainerWithShadows(
                      widthMultiplier: 0.9,
                      heightMultiplier: 0.22,
                      applyGradient: false,
                      child: Padding(
                        padding: EdgeInsets.all(context.height * 0.02),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DownloaderScreenInputField(
                              videoLinkController: videoLinkController,
                              formKey: formKey,
                            ),
                            SizedBox(height: context.height * 0.02),
                            Row(
                              children: [
                                Expanded(
                                  flex: 9,
                                  child: CustomElevatedBtn(
                                    onPressed: () {},
                                    label: AppStrings.download,
                                  ),
                                ),
                                Expanded(child: Container()),
                                Expanded(
                                  flex: 9,
                                  child: CustomElevatedBtn(
                                    onPressed: () {},
                                    label: AppStrings.paste,
                                  ),
                                )
                              ],
                            )
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
      ],
    ));
  }
}
