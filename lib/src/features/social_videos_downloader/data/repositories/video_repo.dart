import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/data/models/video_model.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/domain/entities/video.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/domain/mappers.dart';

import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/video_base_repo.dart';
import '../data_source/video_remote_data_source.dart';

class VideoRepo implements VideoBaseRepo {
  final TiktokVideoBaseRemoteDataSource remoteDataSource;
  //final NetworkInfo networkInfo;

  VideoRepo({required this.remoteDataSource /*, required this.networkInfo*/});

  @override
  Future<Either<Failure, Video>> getVideo(String videoLink) async {
    // if (!await networkInfo.isConnected) {
    //   return const Left(NoInternetConnectionFailure());
    // }
    try {
      final VideoModel video = await remoteDataSource.getVideo(videoLink);
      return Right(video.toDomain());
    } on DioException catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, String>> saveVideo(
      {required String videoLink, required String savePath}) async {
    // if (!await networkInfo.isConnected) {
    //   return const Left(NoInternetConnectionFailure());
    // }
    try {
      final String message = await remoteDataSource.saveVideo(
        savePath: savePath,
        videoLink: videoLink,
      );
      return Right(message);
    } on DioException catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
