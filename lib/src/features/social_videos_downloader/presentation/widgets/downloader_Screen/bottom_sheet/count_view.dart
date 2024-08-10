import 'package:flutter/material.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/domain/entities/video.dart';

import '../../../../../../core/utils/app_colors.dart';

class CountView extends StatelessWidget {
  final String count;
  final IconData icon;

  const CountView({
    super.key,
    required this.count,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(color: AppColors.primaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(count.toString()),
        ],
      ),
    );
  }
}

class BottomSheetCountItems extends StatelessWidget {
  final Video videoData;

  const BottomSheetCountItems({super.key, required this.videoData});

  @override
  Widget build(BuildContext context) {
    print(videoData.stats);
    print(videoData.stats?.viewsCount);
    print(videoData.stats?.videoLenght);
    return Row(
      children: [
        Expanded(
          child: CountView(
            count: videoData.videoLinks.length.toString(),
            icon: Icons.remove_red_eye,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: CountView(
            count: videoData.stats?.viewsCount ?? "",
            icon: Icons.download,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: CountView(
            count: videoData.stats?.videoLenght ?? "",
            icon: Icons.timer_outlined,
          ),
        ),
      ],
    );
  }
}
