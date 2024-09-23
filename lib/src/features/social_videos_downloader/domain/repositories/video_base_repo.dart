import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/domain/entities/video.dart';

import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class VideoBaseRepo {
  Future<Either<Failure, Video>> getVideo(String videoLink);

  Future<Either<Failure, String>> saveVideo({
    required String videoLink,
    required String savePath,
  });
}
