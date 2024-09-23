import 'package:flutter/material.dart';
import 'package:flutter_social_videos_downloader/src/core/utils/app_assets.dart';

import '../../../../domain/entities/video.dart';

class BottomSheetHeader extends StatelessWidget {
  final Video videoData;

  const BottomSheetHeader({super.key, required this.videoData});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FadeInImage(
            width: 150,
            height: 150,
            fit: BoxFit.cover,
            image: NetworkImage(videoData.picture!),
            placeholder: const AssetImage(AppAssets.noInternetImage),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            videoData.title,
            style: Theme.of(context).textTheme.titleMedium,
            maxLines: 5,
          ),
        ),
      ],
    );
  }
}
