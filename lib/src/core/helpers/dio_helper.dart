import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../container_injector.dart';
import '../api/interceptors.dart';
import '../utils/app_constants.dart';

const String _contentType = "Content-Type";
const String _applicationJson = "application/json";
const String _apiKey = "d307bdba37mshafbe7cf23257480p1a6509jsn16f897d20823";
const String _apiHost = "social-media-video-downloader.p.rapidapi.com";

class DioHelper {
  final Dio dio;

  DioHelper({required this.dio}) {
    Map<String, dynamic> headers = {
      _contentType: _applicationJson,
      "X-RapidAPI-Key": _apiKey,
      "X-RapidAPI-Host": _apiHost,
    };
    dio.options = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      receiveDataWhenStatusError: true,
      headers: headers,
    );
    dio.interceptors.add(sl<LogInterceptor>());
    dio.interceptors.add(sl<AppInterceptors>());
  }

  Future<Response> get({
    required String path,
    Map<String, dynamic>? queryParams,
  }) async {
    return await dio.get(path, queryParameters: queryParams);
  }

  Future<Response> download({
    required String downloadLink,
    required String savePath,
    Map<String, dynamic>? queryParams,
  }) async {
    print("downloadLink: $downloadLink");
    print("savePath: $savePath");

    // final file = File(savePath);

    // final raf = file.openSync(mode: FileMode.write);
    // await raf.writeString(downloadLink);
    // return Response(requestOptions: RequestOptions(path: downloadLink));

    Dio dio = Dio();

    // Download the file
    Response<ResponseBody> response = await dio.get<ResponseBody>(
      downloadLink,
      options: Options(
        headers: {
          "X-RapidAPI-Key": _apiKey,
          "X-RapidAPI-Host": _apiHost,
          "Accept": "*/*",
          "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36",
        },
        responseType: ResponseType.stream,
      ),
    );

    final file = File(savePath);
    final raf = file.openSync(mode: FileMode.write);

    // Write data to the file
    await response.data!.stream.listen(
      (data) {
        raf.writeFromSync(data);
      },
      onDone: () async {
        await raf.close();
        print('File downloaded to $savePath');
      },
      onError: (error) {
        raf.close();
        print('Error downloading file: $error');
      },
    ).asFuture();

    return response;

    // var r = await dio.get(
    //   downloadLink,
    //   options: Options(
    //     followRedirects: false,
    //     maxRedirects: 0,
    //     headers: {
    //       "X-RapidAPI-Key": _apiKey,
    //       "X-RapidAPI-Host": _apiHost,
    //     },
    //   ),
    // );

    // print("Response: $r");
    // return Response(requestOptions: RequestOptions(path: downloadLink));



    

    // return await dio.download(
    //   downloadLink,
    //   savePath,
    //   options: Options(
    //     followRedirects: true,
    //     headers: {
    //       "X-RapidAPI-Key": _apiKey,
    //       "X-RapidAPI-Host": _apiHost,
    //       "Accept": "*/*",
    //       "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36",
    //       "Content-Type": "application/json",
    //     },
    //     responseType: ResponseType.bytes,
    //   ),
    // );
  }
}
