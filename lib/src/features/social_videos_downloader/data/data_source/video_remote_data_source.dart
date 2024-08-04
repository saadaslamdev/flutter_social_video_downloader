import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/data/models/video_model.dart';

import '../../../../core/helpers/dio_helper.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_strings.dart';

abstract class TiktokVideoBaseRemoteDataSource {
  Future<VideoModel> getVideo(String videoLink);

  Future<String> saveVideo({
    required String videoLink,
    required String savePath,
  });
}

class TiktokVideoRemoteDataSource implements TiktokVideoBaseRemoteDataSource {
  final DioHelper dioHelper;

  TiktokVideoRemoteDataSource({required this.dioHelper});

  @override
  Future<VideoModel> getVideo(String videoLink) async {
    try {
      final response = await dioHelper.get(
        path: AppConstants.getVideoEndpoint,
        queryParams: {"url": videoLink},
      );
      return VideoModel.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<String> saveVideo({
    required String videoLink,
    required String savePath,
  }) async {
    try {
      await dioHelper.download(savePath: savePath, downloadLink: videoLink);
      return AppStrings.downloadSuccess;
    } catch (error) {
      rethrow;
    }
  }
}
