import 'package:flutter_svg/flutter_svg.dart';

const String basePath = 'assets/images';

class PreLoadAssets {
  final List<String> loadingScreenAssetspath = [
    "$basePath/facebook.svg",
    "$basePath/instagram.svg",
    "$basePath/youtube.svg",
    "$basePath/tiktok.svg",
    "$basePath/youtube_shorts.svg",
  ];

  Future<void> preLoadLoadingScreenAssets() async {
    await _preLoadInitialAssets(loadingScreenAssetspath);
  }

  Future<void> _preLoadInitialAssets(List<String> svgPaths) async {
    for (String path in svgPaths) {
      final asset = SvgAssetLoader(path);
      await svg.cache
          .putIfAbsent(asset.cacheKey(null), () => asset.loadBytes(null));
    }
  }
}
