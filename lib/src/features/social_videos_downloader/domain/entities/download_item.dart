import 'package:equatable/equatable.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/domain/entities/video.dart';

import '../../../../core/utils/app_enums.dart';

class DownloadItem extends Equatable {
  final Video video;
  final String selectedLink;
  final DownloadStatus status;
  final String path;

  const DownloadItem(
      {required this.video,
      required this.selectedLink,
      required this.status,
      required this.path});

  DownloadItem copyWith(
      {Video? video,
      String? selectedLink,
      DownloadStatus? status,
      String? path}) {
    return DownloadItem(
      video: video ?? this.video,
      selectedLink: selectedLink ?? this.selectedLink,
      status: status ?? this.status,
      path: path ?? this.path,
    );
  }

  @override
  List<Object> get props => [video, selectedLink, status, path];
}
