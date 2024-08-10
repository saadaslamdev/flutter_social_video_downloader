import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/domain/entities/video.dart';

import '../../../../../../core/common_widgets/custom_elevated_button.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../bloc/downloader_bloc.dart';
import 'bottom_sheet_header.dart';
import 'count_view.dart';

Future<dynamic> buildDownloadBottomSheet(
  BuildContext context,
  Video video,
) {
  return showModalBottomSheet(
    context: context,
    builder: (_) {
      return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomSheetHeader(videoData: video),
            const SizedBox(height: 10),
            BottomSheetCountItems(videoData: video),
            const SizedBox(height: 10),
            CustomElevatedBtn(
              width: double.infinity,
              label: AppStrings.download,
              onPressed: () {
                context
                    .read<DownloaderBloc>()
                    .add(DownloaderSaveVideo(video: video));
              },
            ),
          ],
        ),
      );
    },
  );
}
