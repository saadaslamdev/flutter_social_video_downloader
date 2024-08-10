import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_videos_downloader/src/core/common_widgets/container_with_shadows.dart';
import 'package:flutter_social_videos_downloader/src/core/common_widgets/custom_elevated_button.dart';
import 'package:flutter_social_videos_downloader/src/core/media_query.dart';
import 'package:flutter_social_videos_downloader/src/core/utils/styles_manager.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../config/routes_manager.dart';
import '../../../../../core/common_widgets/toast.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_enums.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../bloc/downloader_bloc.dart';
import 'bottom_sheet/downloader_bottom_sheet.dart';
import 'downloader_screen_input_field.dart';

class DownloaderScreenBody extends StatefulWidget {
  const DownloaderScreenBody({super.key});

  @override
  State<DownloaderScreenBody> createState() => _DownloaderScreenBodyState();
}

class _DownloaderScreenBodyState extends State<DownloaderScreenBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController videoLinkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DownloaderBloc, DownloaderState>(
      listener: (context, state) {
        if (state is DownloaderSaveVideoLoading) {
          Navigator.of(context).popAndPushNamed(Routes.downloads);
        }
        if (state is DownloaderGetVideoFailure) {
          buildToast(msg: state.message, type: ToastType.error);
        }
        if (state is DownloaderGetVideoSuccess &&
            state.video.videoLinks.isEmpty) {
          buildToast(msg: state.video.message!, type: ToastType.error);
        }
        if (state is DownloaderGetVideoSuccess &&
            state.video.videoLinks.isNotEmpty) {
          print('downloader get video success');
          buildDownloadBottomSheet(context, state.video);
        }
        if (state is DownloaderSaveVideoSuccess) {
          // DirHelper.saveVideoToGallery(state.path);
          // DirHelper.removeFileFromDownloadsDir(state.path);
          buildToast(msg: state.message, type: ToastType.success);
        }
        if (state is DownloaderSaveVideoFailure) {
          buildToast(msg: state.message, type: ToastType.error);
        }
      },
      builder: (context, state) {
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ContainerWithShadows(
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
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<DownloaderBloc>().add(
                                      DownloaderGetVideo(
                                          videoLinkController.text),
                                    );
                              }
                            },
                            label: AppStrings.download,
                          ),
                        ),
                        Expanded(child: Container()),
                        Expanded(
                          flex: 9,
                          child: CustomElevatedBtn(
                            onPressed: () {
                              Clipboard.getData(Clipboard.kTextPlain).then(
                                  (value) => videoLinkController.text =
                                      value?.text! ?? "");
                            },
                            label: AppStrings.paste,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: context.height * 0.03),
            ContainerWithShadows(
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
            ),
          ],
        ));
      },
    );
  }
}
