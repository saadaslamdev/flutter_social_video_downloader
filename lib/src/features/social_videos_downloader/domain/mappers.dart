import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/data/models/video_link_model.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/data/models/video_model.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/domain/entities/video.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/domain/entities/video_link.dart';

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
      );
}

extension VideoDataExtension on VideoLinkModel {
  VideoLink toDomain() => VideoLink(
        quality: quality,
        link: link,
      );
}
