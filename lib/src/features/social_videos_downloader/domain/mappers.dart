import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/data/models/video_link_model.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/data/models/video_model.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/data/models/video_stats_model.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/domain/entities/video.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/domain/entities/video_link.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/domain/entities/video_stats.dart';

extension TiktokVideoExtension on VideoModel {
  Video toDomain() => Video(
        success: success,
        message: message,
        srcUrl: srcUrl,
        ogUrl: ogUrl,
        title: title,
        picture: picture,
        images: images,
        timeTaken: timeTaken,
        rId: rId,
        videoLinks: videoLinks,
        stats: stats,
      );
}

extension VideoDataExtension on VideoLinkModel {
  VideoLink toDomain() => VideoLink(
        quality: quality,
        link: link,
      );
}

extension VideoStatsExtension on VideoStatsModel {
  VideoStats toDomain() => VideoStats(
        videoLenght: videoLenght,
        viewsCount: viewsCount,
      );
}
