import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/data/repositories/video_repo.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/domain/repositories/video_base_repo.dart';

import '../../container_injector.dart';
import 'data/data_source/video_remote_data_source.dart';
import 'domain/usecase/get_video_usecase.dart';
import 'domain/usecase/save_video_usecase.dart';
import 'presentation/bloc/downloader_bloc.dart';

void initDownloader() {
  // data source
  sl.registerLazySingleton<TiktokVideoBaseRemoteDataSource>(
    () => TiktokVideoRemoteDataSource(dioHelper: sl()),
  );
  // repository
  sl.registerLazySingleton<VideoBaseRepo>(
    () => VideoRepo(remoteDataSource: sl() /*, networkInfo: sl()*/),
  );
  // use-case
  sl.registerLazySingleton<GetVideoUseCase>(
    () => GetVideoUseCase(videoRepo: sl()),
  );
  sl.registerLazySingleton<SaveVideoUseCase>(
    () => SaveVideoUseCase(videoRepo: sl()),
  );
  // downloader bloc
  sl.registerFactory(
    () => DownloaderBloc(getVideoUseCase: sl(), saveVideoUseCase: sl()),
  );
}
