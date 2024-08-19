import 'package:flutter/material.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/domain/entities/video.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/font_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import '../../../../domain/entities/video_link.dart';

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
          Icon(icon, color: AppColors.white),
          const SizedBox(width: 10),
          Text(count.toString(),
              style: const TextStyle(color: AppColors.white)),
        ],
      ),
    );
  }
}

class BottomSheetCountItems extends StatefulWidget {
  final Video videoData;
  void Function(String)? onChanged;

  BottomSheetCountItems(
      {super.key, required this.videoData, required this.onChanged});

  @override
  _BottomSheetCountItemsState createState() => _BottomSheetCountItemsState();
}

class _BottomSheetCountItemsState extends State<BottomSheetCountItems> {
  String? selectedQuality;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.videoData.stats != null)
          Row(
            children: [
              Expanded(
                child: CountView(
                  count: formatViewsCount(
                      int.tryParse(widget.videoData.stats?.viewsCount ?? "")),
                  icon: Icons.remove_red_eye,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: CountView(
                  count: formatVideoLength(
                      int.tryParse(widget.videoData.stats?.videoLenght ?? "")),
                  icon: Icons.timer_outlined,
                ),
              ),
            ],
          ),
        const SizedBox(height: 10),
        if (widget.videoData.videoLinks.isNotEmpty)
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.white),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedQuality,
                      hint: const Text(
                        'Select Quality',
                        style: TextStyle(color: AppColors.white),
                      ),
                      icon: const Icon(Icons.arrow_drop_down,
                          color: AppColors.white),
                      dropdownColor: AppColors.primaryColor,
                      isExpanded: true,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      items: widget.videoData.videoLinks.map((VideoLink link) {
                        return DropdownMenuItem<String>(
                          value: link.quality,
                          child: Center(
                            child: Text(
                              link.quality,
                              style: const TextStyle(color: AppColors.white),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedQuality = newValue;
                          widget.onChanged?.call(newValue!);
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          )
      ],
    );
  }

  String formatViewsCount(int? viewsCount) {
    if (viewsCount == null) return "";
    final formatter = NumberFormat.compact();
    return formatter.format(viewsCount);
  }

  String formatVideoLength(int? videoLength) {
    if (videoLength == null) return "";
    final duration = Duration(seconds: videoLength);
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return minutes > 0 ? "$minutes min $seconds sec" : "$seconds sec";
  }
}
