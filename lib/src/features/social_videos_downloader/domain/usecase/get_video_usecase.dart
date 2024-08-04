import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/domain/entities/video.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/domain/repositories/video_base_repo.dart';

import '../../../../core/base_usecase/base_usecase.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

class GetVideoUseCase extends BaseUseCase<Video, String> {
  final VideoBaseRepo videoRepo;

  GetVideoUseCase({required this.videoRepo});

  @override
  Future<Either<Failure, Video>> call(String params) async {
    return await videoRepo.getVideo(params);
  }
}
