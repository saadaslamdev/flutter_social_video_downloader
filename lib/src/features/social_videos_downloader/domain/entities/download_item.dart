import 'package:equatable/equatable.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/domain/entities/video.dart';

import '../../../../core/utils/app_enums.dart';

class DownloadItem extends Equatable {
  final Video video;
  final DownloadStatus status;
  final String path;

  const DownloadItem(
      {required this.video, required this.status, required this.path});

  DownloadItem copyWith({Video? video, DownloadStatus? status, String? path}) {
    return DownloadItem(
      video: video ?? this.video,
      status: status ?? this.status,
      path: path ?? this.path,
    );
  }

  @override
  List<Object> get props => [video, status, path];
}