import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/data/models/video_link_model.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/data/models/video_stats_model.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/domain/entities/video.dart';

class VideoModel extends Video {
  const VideoModel({
    required super.success,
    required super.message,
    required super.srcUrl,
    required super.ogUrl,
    required super.title,
    required super.picture,
    required super.images,
    required super.timeTaken,
    required super.rId,
    required super.videoLinks,
    super.stats,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      success: json['success'] ?? false,
      message: json['message'] ?? "",
      srcUrl: json['src_url'] ?? "",
      ogUrl: json['og_url'] ?? "",
      title: json['title'] ?? "",
      picture: json['picture'] ?? "",
      images: List<String>.from(json['images'] ?? []),
      timeTaken: json['timeTaken'] ?? "",
      rId: json['r_id'] ?? "",
      videoLinks: json['links'] != null
          ? (json['links'] as List)
              .map((linkJson) => VideoLinkModel.fromJson(linkJson))
              .toList()
          : [],
      stats: json['stats'] != null
          ? VideoStatsModel.fromJson(json['stats'])
          : null,
    );
  }
}
