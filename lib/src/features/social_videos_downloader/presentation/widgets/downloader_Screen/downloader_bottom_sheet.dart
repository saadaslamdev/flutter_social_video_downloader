import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/domain/entities/video.dart';

Future<dynamic> buildDownloadBottomSheet(
  BuildContext context,
  Video tikTokVideo,
) {
  return showModalBottomSheet(
    context: context,
    builder: (_) {
      return Container(
        padding: const EdgeInsets.all(10),
        child: Container(child: Text('test')),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     BottomSheetHeader(videoData: videoData),
        //     const SizedBox(height: 10),
        //     BottomSheetCountItems(videoData: videoData),
        //     const SizedBox(height: 10),
        //     CustomElevatedBtn(
        //       width: double.infinity,
        //       label: AppStrings.download,
        //       onPressed: () {
        //         context
        //             .read<DownloaderBloc>()
        //             .add(DownloaderSaveVideo(tikTokVideo: tikTokVideo));
        //       },
        //     ),
        //   ],
        // ),
      );
    },
  );
}
