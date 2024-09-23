import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_videos_downloader/src/core/media_query.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/domain/entities/video.dart';

import '../../../../../../core/common_widgets/custom_elevated_button.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../bloc/downloader_bloc/downloader_bloc.dart';
import 'bottom_sheet_header.dart';
import 'count_view.dart';

Future<dynamic> buildDownloadBottomSheet(
  BuildContext context,
  Video video,
) {
  var selectedQuality = video.videoLinks.first.quality;
  print(selectedQuality);
  return showModalBottomSheet(
    context: context,
    builder: (_) {
      return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                  height: context.height * 0.012,
                  width: context.width * 0.2,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  )),
            ),
            const SizedBox(height: 10),
            BottomSheetHeader(videoData: video),
            const SizedBox(height: 10),
            BottomSheetCountItems(
                videoData: video,
                onChanged: (_) {
                  selectedQuality = _;
                  print(selectedQuality);
                }),
            const SizedBox(height: 10),
            CustomElevatedBtn(
              width: double.infinity,
              label: AppStrings.download,
              onPressed: () {
                context.read<DownloaderBloc>().add(DownloaderSaveVideo(
                      video: video,
                      selectedLink: selectedQuality,
                    ));
              },
            ),
          ],
        ),
      );
    },
  );
}
