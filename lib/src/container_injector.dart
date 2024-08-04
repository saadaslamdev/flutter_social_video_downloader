import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'core/api/interceptors.dart';
import 'core/helpers/dio_helper.dart';
import 'features/social_videos_downloader/downloader_injector.dart';

final sl = GetIt.instance;

void initCore() {
  // Dio
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<AppInterceptors>(() => AppInterceptors());
  sl.registerLazySingleton<LogInterceptor>(
    () => LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ),
  );

  // Dio Factory
  sl.registerLazySingleton<DioHelper>(
    () => DioHelper(dio: sl<Dio>()),
  );

  // Network info
  // sl.registerLazySingleton<NetworkInfo>(
  //   () => NetworkInfoImpl(connectionChecker: sl<InternetConnectionChecker>()),
  // );

  // Internet Connection Checker
  // sl.registerLazySingleton<InternetConnectionChecker>(
  //   () => InternetConnectionChecker(),
  // );
}

void initApp() {
  // Init core injector
  initCore();

  // Init downloader Bloc
  initDownloader();
  print('initApp');
}
